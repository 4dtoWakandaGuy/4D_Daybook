If (False:C215)
	//object Name: [CONTACTS]Contact_In.Invisible Button
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:04
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_NextColumnNumber)
	C_TEXT:C284($_t_LayoutRef; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].Contact_In.Invisible Button"; Form event code:C388)
If (User in group:C338(Current user:C182; "Administrator"))
	Gen_Confirm("Are you sure you want to reset the Further Analysis setup?"; "Yes"; "No")
	If (OK=1)
		Gen_Alert("You will need to exit the current view of contacts")
		READ WRITE:C146([LIST_LAYOUTS:96])
		
		QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="14405")
		DELETE SELECTION:C66([LIST_LAYOUTS:96])
		$_t_LayoutRef:="14406"
		$_l_NextColumnNumber:=1
		$_l_NextColumnNumber:=Layouts_Create($_t_LayoutRef; 144; Field:C253(->[CONTACTS_RECORD_ANALYSIS:144]Contact_Code:3); "Record"; ""; 0; $_l_NextColumnNumber; False:C215; True:C214)
		$_l_NextColumnNumber:=Layouts_Create($_t_LayoutRef; 144; Field:C253(->[CONTACTS_RECORD_ANALYSIS:144]ID:2); "ID"; ""; 0; $_l_NextColumnNumber; False:C215; False:C215)
		$_l_NextColumnNumber:=Layouts_Create($_t_LayoutRef; Table:C252(->[CONTACTS_RECORD_ANALYSIS:144]); Field:C253(->[CONTACTS_RECORD_ANALYSIS:144]Analysis_Code:1); "Code"; ""; 80; $_l_NextColumnNumber; True:C214; False:C215; "")
		$_l_NextColumnNumber:=Layouts_Create($_t_LayoutRef; 53; 2; "Name"; ""; 135; $_l_NextColumnNumber; False:C215; False:C215; "RELATE ONE ([Contacts_FURTHERS]Further Code)")
		CANCEL:C270
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [CONTACTS].Contact_In.Invisible Button"; $_t_oldMethodName)
