//%attributes = {}
If (False:C215)
	//Project Method Name:      Projects_PPQtnI
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/08/2009 16:53
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ProductCount)
	C_REAL:C285($_r_Total)
	C_TEXT:C284($_t_CR; $_t_FieldDelimiter; $_t_oldMethodName; Enclosures; Products; ProductsD)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Projects_PPQtnI")
If ((Documents_4DWriteAccessType(False:C215))="W")
	$_t_FieldDelimiter:=Char:C90(9)
Else 
	$_t_FieldDelimiter:=", "
End if 
$_t_CR:=Char:C90(13)
$_r_Total:=0
Products:=""
$_l_ProductCount:=0
QUERY:C277([JOBS:26]; [JOBS:26]Project_Code:27=[PROJECTS:89]Project_Code:1)
ORDER BY:C49([JOBS:26]; [JOBS:26]Job_Code:1)

FIRST RECORD:C50([JOBS:26])
While (Not:C34(End selection:C36([JOBS:26])))
	$_l_ProductCount:=$_l_ProductCount+1
	
	Products:=Products+Char:C90(64+$_l_ProductCount)+") "+[JOBS:26]Job_Name:2+$_t_CR+$_t_CR
	
	If ([JOBS:26]Print_Comments:48)
		Products:=Products+[JOBS:26]Comments:15
		If (Substring:C12(Products; Length:C16(Products)-1; 2)#($_t_CR+$_t_CR))
			Products:=Products+$_t_CR
			If (Substring:C12(Products; Length:C16(Products)-1; 2)#($_t_CR+$_t_CR))
				Products:=Products+$_t_CR
			End if 
		End if 
	End if 
	
	QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=[JOBS:26]Job_Code:1)
	ORDER BY:C49([JOB_STAGES:47]; [JOB_STAGES:47]Stage_Code:2)
	
	FIRST RECORD:C50([JOB_STAGES:47])
	While (Not:C34(End selection:C36([JOB_STAGES:47])))
		$_r_Total:=$_r_Total+[JOB_STAGES:47]AS_Quoted_Amount:7
		Products:=Products+[JOB_STAGES:47]Stage_Name:3+$_t_FieldDelimiter+String:C10([JOB_STAGES:47]AS_Quoted_Amount:7; "|Accounts")+$_t_CR
		If (([JOB_STAGES:47]Print_Description:49) & ([JOB_STAGES:47]Description:48#""))
			Products:=Products+[JOB_STAGES:47]Description:48
			If (Substring:C12(Products; Length:C16(Products)-1; 2)#($_t_CR+$_t_CR))
				Products:=Products+$_t_CR
				If (Substring:C12(Products; Length:C16(Products)-1; 2)#($_t_CR+$_t_CR))
					Products:=Products+$_t_CR
				End if 
			End if 
		End if 
		NEXT RECORD:C51([JOB_STAGES:47])
	End while 
	
	NEXT RECORD:C51([JOBS:26])
	Products:=Products+$_t_CR
End while 
Products:=Products+$_t_CR+"TOTAL"+$_t_FieldDelimiter+String:C10($_r_Total; "|Accounts")+$_t_CR
Enclosures:=""
ProductsD:=Products
ERR_MethodTrackerReturn("Projects_PPQtnI"; $_t_oldMethodName)
