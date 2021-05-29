//%attributes = {}



ASSERT:C1129(brightnessByColor("#000000")=0)
ASSERT:C1129(brightnessByColor("#FFFFFF")=1)

ASSERT:C1129(brightnessByColor("#DDDDDD")>0.5)
ASSERT:C1129(brightnessByColor("#EDEDED")>0.5)
ASSERT:C1129(brightnessByColor("#E2E2ED")>0.5)

ASSERT:C1129(0.5>brightnessByColor("#202020"))
ASSERT:C1129(0.5>brightnessByColor("#2F2F2F"))

