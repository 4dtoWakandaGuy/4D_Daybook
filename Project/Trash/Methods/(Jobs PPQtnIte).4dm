//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Jobs_PPQtnIte
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/08/2009 10:21
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285($Tot)
	C_TEXT:C284($_t_FieldDelimiter; $_t_oldMethodName; $Rec; Enclosures; Products; ProductsD)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_PPQtnIte")
If ((Documents_4DWriteAccessType(False:C215))="W")
	$_t_FieldDelimiter:=Char:C90(9)
Else 
	$_t_FieldDelimiter:=", "
End if 
$Rec:=Char:C90(13)
$Tot:=0
Products:=""

If ([JOBS:26]Print_Comments:48)
	Products:=Products+[JOBS:26]Comments:15
	If (Substring:C12(Products; Length:C16(Products)-1; 2)#($Rec+$Rec))
		Products:=Products+$Rec
		If (Substring:C12(Products; Length:C16(Products)-1; 2)#($Rec+$Rec))
			Products:=Products+$Rec
		End if 
	End if 
End if 
ORDER BY:C49([JOB_STAGES:47]; [JOB_STAGES:47]Stage_Code:2)

FIRST RECORD:C50([JOB_STAGES:47])
While (Not:C34(End selection:C36([JOB_STAGES:47])))
	$Tot:=$Tot+[JOB_STAGES:47]AS_Quoted_Amount:7
	Products:=Products+[JOB_STAGES:47]Stage_Name:3+$_t_FieldDelimiter+String:C10([JOB_STAGES:47]AS_Quoted_Amount:7; "|Accounts")+$Rec
	If (([JOB_STAGES:47]Print_Description:49) & ([JOB_STAGES:47]Description:48#""))
		Products:=Products+[JOB_STAGES:47]Description:48
		If (Substring:C12(Products; Length:C16(Products)-1; 2)#($Rec+$Rec))
			Products:=Products+$Rec
			If (Substring:C12(Products; Length:C16(Products)-1; 2)#($Rec+$Rec))
				Products:=Products+$Rec
			End if 
		End if 
	End if 
	NEXT RECORD:C51([JOB_STAGES:47])
End while 
Products:=Products+$Rec+"TOTAL"+$_t_FieldDelimiter+String:C10($Tot; "|Accounts")+$Rec
Enclosures:=""
ProductsD:=Products
ERR_MethodTrackerReturn("Jobs_PPQtnIte"; $_t_oldMethodName)