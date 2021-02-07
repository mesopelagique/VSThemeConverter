//%attributes = {}

ASSERT:C1129(rtrim("")="")
ASSERT:C1129(rtrim(" ")="")
ASSERT:C1129(rtrim("  ")="")
ASSERT:C1129(rtrim("a")="a")
ASSERT:C1129(rtrim(" a")="a")
ASSERT:C1129(rtrim("  a")="a")
ASSERT:C1129(rtrim("  a ")="a ")
ASSERT:C1129(rtrim("  ab ")="ab ")