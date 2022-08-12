//%attributes = {}
If (False:C215)
	//Project Method Name:      Minor_DelSin
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_DocumentsTable; $_l_PersonnelTable; $_l_TableNumber)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Minor_DelSin")
$_l_PersonnelTable:=Table:C252(->[PERSONNEL:11])
$_l_TableNumber:=Table:C252($1)
$_l_DocumentsTable:=Table:C252(->[DOCUMENTS:7])

If (Count parameters:C259=1)
	Are_You_Sure
	If (OK=1)
		Case of 
			: ($_l_PersonnelTable=$_l_TableNumber)
				CREATE SET:C116($1->; "Master")
				[PERSONNEL:11]PersonDeleted:38:=1
				DB_SaveRecord(->[PERSONNEL:11])
				AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
				CANCEL:C270
				QUERY:C277($1->; [PERSONNEL:11]PersonDeleted:38#1)
				CREATE SET:C116($1->; "Master")
				USE SET:C118("Master")
				Gen_InNoF($1)
			: ($_l_DocumentsTable=$_l_TableNumber)
				CREATE SET:C116($1->; "Master")
				[DOCUMENTS:7]Document_Status:15:=-(Abs:C99([DOCUMENTS:7]Document_Status:15)+100)
				DB_SaveRecord(->[DOCUMENTS:7])
				CANCEL:C270
				CREATE SET:C116($1->; "Master")
				USE SET:C118("Master")
				Gen_InNoF($1)
			Else 
				CREATE SET:C116($1->; "Master")
				DB_DeletionControl($1; "Minor_DelSin")
				
				DELETE RECORD:C58($1->)
				CANCEL:C270
				USE SET:C118("Master")
				Gen_InNoF($1)
		End case 
		
	End if 
Else 
	Gen_Alert("Cannot delete")
End if 
ERR_MethodTrackerReturn("Minor_DelSin"; $_t_oldMethodName)
