"""Quota windows must be identified by duration, not primary/secondary order."""
from pathlib import Path
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'tools'))
from codex_chat_usage import normalize_usage


def window(minutes, percent, reset=123456):
    return {'windowDurationMins': minutes, 'usedPercent': percent, 'resetsAt': reset}


class UsageLimitsTests(unittest.TestCase):
    def test_prefers_codex_bucket_over_legacy(self):
        result = normalize_usage({'rateLimits': {'primary': window(300, 90)},
            'rateLimitsByLimitId': {'codex': {'primary': window(300, 25),
                                            'secondary': window(10080, 40)}}}, now=100)
        self.assertEqual(result['windows']['five_hour']['used_percent'], 25)
        self.assertEqual(result['windows']['weekly']['used_percent'], 40)
        self.assertEqual(result['updated_at'], 100)

    def test_weekly_primary_and_missing_five_hour(self):
        result = normalize_usage({'rateLimits': {'primary': window(10080, 31), 'secondary': None}})
        self.assertEqual(result['windows']['weekly']['used_percent'], 31)
        self.assertIsNone(result['windows']['five_hour'])

    def test_zero_is_real_usage_and_missing_is_not_zero(self):
        result = normalize_usage({'rateLimits': {'secondary': window(300, 0)}})
        self.assertEqual(result['windows']['five_hour']['used_percent'], 0)
        self.assertIsNone(result['windows']['weekly'])
        self.assertIsNone(normalize_usage({})['windows']['five_hour'])

    def test_other_buckets_and_other_durations_are_not_mislabeled(self):
        result = normalize_usage({'rateLimitsByLimitId': {'another_product': {'primary': window(300, 10)}},
                                  'rateLimits': {'primary': window(300, 99)}})
        self.assertIsNone(result['windows']['five_hour'])
        result = normalize_usage({'rateLimits': {'primary': window(15, 10)}})
        self.assertIsNone(result['windows']['five_hour'])

    def test_invalid_values_and_clamping(self):
        for percent in (None, True, '20', float('nan'), float('inf')):
            result = normalize_usage({'rateLimits': {'primary': window(300, percent)}})
            self.assertIsNone(result['windows']['five_hour'])
        result = normalize_usage({'rateLimits': {'primary': window(300, 120, None),
                                                'secondary': window(10080, -2)}})
        self.assertEqual(result['windows']['five_hour']['used_percent'], 100)
        self.assertIsNone(result['windows']['five_hour']['resets_at'])
        self.assertEqual(result['windows']['weekly']['used_percent'], 0)


if __name__ == '__main__':
    unittest.main()
