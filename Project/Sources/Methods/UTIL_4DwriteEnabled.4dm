//%attributes = {}

If (False:C215)
	//Project Method Name:      UTIL_4DwriteEnabled
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  20/07/2021
	//Created BY:  NIgel Greenlee
	
	//Date Modified: 
	//Modified By: NIgel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	//C_UNKNOWN($0)
	C_BOOLEAN:C305($_bo_4DWriteFound; $_bo_4DWriteInstalled)
	C_OBJECT:C1216($_obj_Licence; $_obj_Text; $_obj_ThisLicence)
End if 
//Code Starts Here
$_obj_Text:=ds:C1482
$_obj_Licence:=Get license info:C1489
$_bo_4DWriteInstalled:=False:C215
$_bo_4DWriteFound:=False:C215
If (Not:C34($_obj_Licence.products=Null:C1517))
	For each ($_obj_ThisLicence; $_obj_Licence.products) Until ($_bo_4DWriteFound)
		
		If ($_obj_ThisLicence.name="4D write@")
			$_bo_4DWriteFound:=True:C214
			$_bo_4DWriteInstalled:=True:C214
		End if 
	End for each 
End if 
$0:=$_bo_4DWriteInstalled
