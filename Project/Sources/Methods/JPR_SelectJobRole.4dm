//%attributes = {}
If (False:C215)
	//Project Method Name:      JPR_SelectJobRole
	//------------------ Method Notes ------------------
	//NG April 2004
	//this new method is for use with job stages.
	//it allows the job role of the personnel
	//within the stage to be selected.
	//the initial display is the roles from the [CONTACTS]xChargeOutRates
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 18:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	C_BOOLEAN:C305(GEN_Bo_ShowCreate)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_Index; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $0; DB_t_WindowTitle; GEN_t_CancelText; GEN_t_OKText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JPR_SelectJobRole")

If (Count parameters:C259>=1)
	If (Size of array:C274($1->)>0)
		ARRAY TEXT:C222(GEN_at_DropDownMenu; Size of array:C274($1->)+2)
		ARRAY LONGINT:C221(GEN_al_DropDownMenuID; Size of array:C274($1->)+2)
		For ($_l_Index; 1; Size of array:C274($1->))
			GEN_at_DropDownMenu{$_l_Index}:=$1->{$_l_Index}
			GEN_al_DropDownMenuID{$_l_Index}:=$_l_Index
		End for 
		GEN_at_DropDownMenu{Size of array:C274(GEN_at_DropDownMenu)}:="New Job Role"
		GEN_at_DropDownMenu{Size of array:C274(GEN_at_DropDownMenu)-1}:="-"
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; -1986)
		
		GEN_Bo_ShowCreate:=False:C215
		DB_t_WindowTitle:="Select Job Role.."
		GEN_t_OKText:="Select"  //New Values NG March 2004
		GEN_t_CancelText:="Stop"  //New Values NG March 2004
		DIALOG:C40([USER:15]; "Gen_PopUpChoice")
		CLOSE WINDOW:C154
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
		If (GEN_at_DropDownMenu>0)
			If (GEN_at_DropDownMenu<Size of array:C274(GEN_at_DropDownMenu))
				$0:=GEN_at_DropDownMenu{GEN_at_DropDownMenu}
				GEN_at_DropDownMenu:=0
				
			Else 
				//select a new job Role
				CON_JobroleManager([CONTACTS:1]x_ID:33)
			End if 
			
			
		End if 
	Else 
		//no job roles are set for this contact so set them
		CON_JobroleManager([CONTACTS:1]x_ID:33)
		
	End if 
End if 
ERR_MethodTrackerReturn("JPR_SelectJobRole"; $_t_oldMethodName)