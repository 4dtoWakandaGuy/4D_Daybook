If (False:C215)
	//object Name: [EW_ExportProjects]StaticTextBK.Variable19
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(EW_at_BKFieldNames;0)
	C_TEXT:C284($_t_oldMethodName; tText)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].StaticTextBK.Variable19"; Form event code:C388)
//[Calculations]entry
// bOK button

Case of 
	: (tText="")
		//    ALERT("Please enter some text!")
		Gen_Alert("Please enter some text!")
	: (EW_at_BKFieldNames<1)
		//    ALERT("Please select an ecommerce field for this text.")
		Gen_Alert("Please select an ecommerce field for this text.")
	Else 
		ACCEPT:C269
End case 
ERR_MethodTrackerReturn("OBJ [EW_ExportProjects].StaticTextBK.Variable19"; $_t_oldMethodName)
