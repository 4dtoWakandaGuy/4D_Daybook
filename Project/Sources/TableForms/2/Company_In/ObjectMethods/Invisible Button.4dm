If (False:C215)
	//object Name: [COMPANIES]Company_In.Invisible Button
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_NextColumnNo)
	C_REAL:C285(NextColumnNo)
	C_TEXT:C284($_t_LayoutRef; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].Company_In.Invisible Button"; Form event code:C388)

If (User in group:C338(Current user:C182; "Administrator"))
	Gen_Confirm("Are you sure you want to reset the Further Analysis setup?"; "Yes"; "No")
	If (OK=1)
		Gen_Alert("You will need to exit the current view of companies")
		READ WRITE:C146([LIST_LAYOUTS:96])
		
		QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1="14601")
		DELETE SELECTION:C66([LIST_LAYOUTS:96])
		$_t_LayoutRef:="14601"
		$_l_NextColumnNo:=1
		$_l_NextColumnNo:=Layouts_Create($_t_LayoutRef; 146; Field:C253(->[COMPANIES_RECORD_ANALYSIS:146]Company_Code:4); "Record"; ""; 0; $_l_NextColumnNo; False:C215; True:C214)
		$_l_NextColumnNo:=Layouts_Create($_t_LayoutRef; 146; Field:C253(->[COMPANIES_RECORD_ANALYSIS:146]ID:2); "ID"; ""; 0; $_l_NextColumnNo; False:C215; False:C215)
		$_l_NextColumnNo:=Layouts_Create($_t_LayoutRef; 146; Field:C253(->[COMPANIES_RECORD_ANALYSIS:146]Analysis_Code:1); "Further Code"; ""; 70; $_l_NextColumnNo; True:C214)
		$_l_NextColumnNo:=Layouts_Create($_t_LayoutRef; 53; 2; "Name"; ""; 135; $_l_NextColumnNo; False:C215; False:C215; "RELATE ONE([Companies_Furthers]Further Code)")
		CANCEL:C270
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].Company_In.Invisible Button"; $_t_oldMethodName)
