//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Minor_DelEx
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
	C_LONGINT:C283($_l_DocumentsTable; $_l_Index; $_l_PersonnelTable; $_l_TableNumber)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Minor_DelEx")
$_l_PersonnelTable:=Table:C252(->[PERSONNEL:11])
$_l_TableNumber:=Table:C252($1)
$_l_DocumentsTable:=Table:C252(->[DOCUMENTS:7])
If (Records in set:C195("Userset")>0)
	Are_You_Sure
	If (OK=1)
		Case of 
			: ($_l_PersonnelTable=$_l_TableNumber)
				CREATE SET:C116($1->; "Master")
				USE SET:C118("UserSet")
				CREATE SET:C116($1->; "Master2")
				If (Not:C34(In transaction:C397))
					DB_lockFile(->[PERSONNEL:11])
					APPLY TO SELECTION:C70([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38:=1)
					
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[PERSONNEL:11]))
				Else 
					FIRST RECORD:C50([PERSONNEL:11])
					For ($_l_Index; 1; Records in selection:C76([PERSONNEL:11]))
						[PERSONNEL:11]PersonDeleted:38:=1
						DB_SaveRecord(->[PERSONNEL:11])
						AA_CheckFileUnlockedByTableNUM(Table:C252(->[PERSONNEL:11]))
						NEXT RECORD:C51([PERSONNEL:11])
					End for 
				End if 
				QUERY:C277($1->; [PERSONNEL:11]PersonDeleted:38#1)
				DIFFERENCE:C122("Master"; "Master2"; "Master")
				CLEAR SET:C117("Master2")
				
				USE SET:C118("Master")
				Gen_InNoF($1)
			: ($_l_DocumentsTable=$_l_TableNumber)
				CREATE SET:C116($1->; "Master")
				USE SET:C118("UserSet")
				CREATE SET:C116($1->; "Master2")
				DB_lockFile(->[DOCUMENTS:7])
				APPLY TO SELECTION:C70([DOCUMENTS:7]; [DOCUMENTS:7]Document_Status:15:=-(Abs:C99([DOCUMENTS:7]Document_Status:15)+100))
				
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[DOCUMENTS:7]))
				DIFFERENCE:C122("Master"; "Master2"; "Master")
				CLEAR SET:C117("Master2")
				USE SET:C118("Master")
				Gen_InNoF($1)
			Else 
				CREATE SET:C116($1->; "Master")
				USE SET:C118("Userset")
				Minor_DelRecords($1; $2; $3)
				DELETE SELECTION:C66($1->)
				USE SET:C118("Master")
				Gen_OutNoF($1)
		End case 
		
	End if 
End if 
ERR_MethodTrackerReturn("Minor_DelEx"; $_t_oldMethodName)
