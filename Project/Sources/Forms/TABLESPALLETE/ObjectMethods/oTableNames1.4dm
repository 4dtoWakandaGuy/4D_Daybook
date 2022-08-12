If (False:C215)
	//object Method Name: Object Name:      TABLESPALLETE.oTableNames1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/01/2015 14:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(LB_al_TableNumbers;0)
	C_LONGINT:C283($_l_Column; $_l_Event; $_l_Row; $_l_TableNumber; DB_l_CallBackProcess; DB_l_SwitchToTable)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/TABLESPALLETE/oTableNames1"; Form event code:C388)


ERR_MethodTrackerReturn("OBJ TABLESPALLETE.oTableNames1"; $_t_oldMethodName)

$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Clicked:K2:4)
		If (DB_l_CallBackProcess>0)
			LISTBOX GET CELL POSITION:C971(*; "oTableNames1"; $_l_Column; $_l_Row)
			
			$_l_TableNumber:=LB_al_TableNumbers{$_l_Row}
			SET PROCESS VARIABLE:C370(DB_l_CallBackProcess; DB_l_SwitchToTable; $_l_TableNumber)
			POST OUTSIDE CALL:C329(DB_l_CallBackProcess)
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [projectForm]/TABLESPALLETE/oTableNames1"; $_t_oldMethodName)
