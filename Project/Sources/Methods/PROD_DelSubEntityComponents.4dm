//%attributes = {}
If (False:C215)
	//Project Method Name:      PROD_DelSubEntityComponents
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/11/2009`Method: PROD_DelSubEntityComponents
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PRD_LB_ProdComponents;0)
	ARRAY LONGINT:C221($_al_Lines; 0)
	//ARRAY LONGINT(PROD_al_ComponentID;0)
	//ARRAY LONGINT(PROD_al_ComponentsDEL;0)
	//ARRAY TEXT(PROD_at_ComponentsNM;0)
	C_LONGINT:C283($_l_ComponentID; $_l_Row)
	C_TEXT:C284($_t_Message; $_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("PROD_DelSubEntityComponents")

//NG Feb 2004
//The method is only applicable within the form [Products]Products_In
//It is the script of the button bPROD_l_COmponentsDelete which adds an analyses(or clears an entry)
//it is in a method so the call can be via an outside call
$_t_oldMethodName:=ERR_MethodTracker("PROD_DelSubEntityComponents"; Form event code:C388)
ARRAY LONGINT:C221($_al_Lines; 0)
LB_GetSelect(->PRD_LB_ProdComponents; ->$_al_Lines)
If (Size of array:C274($_al_Lines)>=1)
	If (Size of array:C274($_al_Lines)>1)
		$_t_Message:="Do you wish to remove these components "
	Else 
		$_t_Message:="Do you wish to remove thie component "
	End if 
	Gen_Confirm($_t_Message+PROD_at_ComponentsNM{$_al_Lines{1}}; "Yes"; "No")
	If (Ok=1)
		$_l_Row:=$_al_Lines{1}
		$_l_ComponentID:=PROD_al_ComponentID{$_l_Row}
		APPEND TO ARRAY:C911(PROD_al_ComponentsDEL; $_l_ComponentID)
		LISTBOX DELETE ROWS:C914(PRD_LB_ProdComponents; $_al_Lines{1})
		
		LBI_Scrollonresize(->PRD_LB_ProdComponents)
	End if 
	
End if 
ERR_MethodTrackerReturn("PROD_DelSubEntityComponents"; $_t_oldMethodName)
