//%attributes = {}
If (False:C215)
	//Project Method Name:      CreateFileRecord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CreateFileRecord")
//READ WRITE([FILES])
QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=$1)
If (Records in selection:C76([IDENTIFIERS:16])=0)
	CREATE RECORD:C68([IDENTIFIERS:16])
	[IDENTIFIERS:16]Table_Number:1:=$1
	DB_SaveRecord(->[IDENTIFIERS:16])
	UNLOAD RECORD:C212([IDENTIFIERS:16])  //BSW This is must
	REDUCE SELECTION:C351([IDENTIFIERS:16]; 0)  //BSW This is must
End if 
READ ONLY:C145([IDENTIFIERS:16])
QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=$1)
ERR_MethodTrackerReturn("CreateFileRecord"; $_t_oldMethodName)