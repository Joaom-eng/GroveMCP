#include <cstddef>
#include <CPed.h>
#include <CPedIntelligence.h>
#include <CTaskManager.h>
// Compile-time verification of every fixed offset used by the task overlay.
static_assert(sizeof(void*) == 4);
static_assert(offsetof(CPed, m_pIntelligence) == 0x47C);
static_assert(offsetof(CPedIntelligence, m_TaskMgr) == 4);
static_assert(offsetof(CTaskManager, m_aPrimaryTasks) == 0);
static_assert(offsetof(CTaskManager, m_pPed) == 0x2C);
static_assert(TASK_PRIMARY_MAX == 5);
