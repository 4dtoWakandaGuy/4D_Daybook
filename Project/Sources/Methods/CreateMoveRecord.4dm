//%attributes = {}
If (False:C215)
	//Project Method Name:      CreateMoveRecord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/08/2009 12:10:03If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0; $2)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CreateMoveRecord")
$0:=False:C215
QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$1)
If (Records in selection:C76([MOVEMENT_TYPES:60])=0)
	CREATE RECORD:C68([MOVEMENT_TYPES:60])
	[MOVEMENT_TYPES:60]Type_Code:1:=$1
	If (False:C215)
		QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1>999; *)
		QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94];  & ; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1<2000)
		If (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0)
			ORDER BY:C49([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1; >)
			LAST RECORD:C200([IDENTIFIERS_MULTI_NUMBERS:94])
			[MOVEMENT_TYPES:60]MN_Identifier_Number:24:=[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1+1
			$0:=True:C214
		Else 
			[MOVEMENT_TYPES:60]MN_Identifier_Number:24:=1000  // NG June 2004 could be a cause because the record is now locked in this method
		End if 
	Else 
		[MOVEMENT_TYPES:60]MN_Identifier_Number:24:=AA_GetNextID(->[MOVEMENT_TYPES:60]MN_Identifier_Number:24)
	End if 
	
	// [MOVEMENT TYPES]MN File No:=1  `Turn Multiple numbers on
	If (Count parameters:C259<2)
		DB_SaveRecord(->[MOVEMENT_TYPES:60])
		UNLOAD RECORD:C212([MOVEMENT_TYPES:60])  //BSW This is must
		REDUCE SELECTION:C351([MOVEMENT_TYPES:60]; 0)  //BSW This is must
		READ ONLY:C145([MOVEMENT_TYPES:60])
		$0:=False:C215
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$1)
	Else 
		If ($2)
			$0:=False:C215
			DB_SaveRecord(->[MOVEMENT_TYPES:60])
			UNLOAD RECORD:C212([MOVEMENT_TYPES:60])  //BSW This is must
			REDUCE SELECTION:C351([MOVEMENT_TYPES:60]; 0)  //BSW This is must
			READ ONLY:C145([MOVEMENT_TYPES:60])
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$1)
		End if 
		
	End if 
Else 
	$0:=False:C215
	
End if 
ERR_MethodTrackerReturn("CreateMoveRecord"; $_t_oldMethodName)