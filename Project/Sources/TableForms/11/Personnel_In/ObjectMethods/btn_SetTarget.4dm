If (False:C215)
	//object Name: [PERSONNEL]Personnel_In.btn_SetTarget
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(DOC_at_PDF995Path;0)
	//ARRAY TEXT(PDF_at_MachineNames;0)
	C_TEXT:C284($_t_oldMethodName; DOC_t_PDF995Path)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Personnel_In.btn_SetTarget"; Form event code:C388)

If (Form event code:C388=On Clicked:K2:4)
	$_ti_DocumentRef:=DB_OpenDocument(""; "")
	If (OK=1)
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
		DOC_t_PDF995Path:=DOCUMENT
		If (Size of array:C274(DOC_at_PDF995Path)>=PDF_at_MachineNames)  //Added 28/10//08 v631b120b -kmw (Surely this should behave the same way (by updating the array now) as if the user had altered DOC_t_PDF995Path manually)
			DOC_at_PDF995Path{PDF_at_MachineNames}:=DOC_t_PDF995Path  //Added 28/10//08 v631b120b -kmw (Surely this should behave the same way (by updating the array now) as if the user had altered DOC_t_PDF995Path manually)
		End if   //Added 28/10//08 v631b120b -kmw (Surely this should behave the same way (by updating the array now) as if the user had altered DOC_t_PDF995Path manually)
	End if 
End if 

ERR_MethodTrackerReturn("OBJ:Personnel_In,bSetTarget"; $_t_oldMethodName)
