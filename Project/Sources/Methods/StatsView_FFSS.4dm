//%attributes = {}
If (False:C215)
	//Project Method Name:      StatsView_FFSS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 14:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_UniqueNumbers; 0)
	//ARRAY LONGINT(SV_al_TableNumber;0)
	ARRAY TEXT:C222($_at_UniqueCode; 0)
	ARRAY TEXT:C222($_at_UniqueCodes; 0)
	//ARRAY TEXT(DB_at_TableName;0)
	C_LONGINT:C283($_l_CountRecords; $_l_Index; $_l_SizeofArray; $3; $j)
	C_POINTER:C301($_Ptr_Table; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_UniqueCode; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView_FFSS")
//StatsView_FFSS - FurthFld Search Selection

$_Ptr_Table:=Table:C252(SV_al_TableNumber{DB_at_TableName})
$_l_CountRecords:=Records in selection:C76($_Ptr_Table->)
Case of 
	: ($_l_CountRecords=0)
		REDUCE SELECTION:C351([CUSTOM_FIELDS:98]; 0)
	: ($_l_CountRecords=1)
		If ($3=9)
			$_t_UniqueCode:=$2+String:C10($1->)
		Else 
			$_t_UniqueCode:=$2+$1->
		End if 
		QUERY SELECTION:C341([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Unique_Code:2=$_t_UniqueCode)
	Else 
		
		If ($3=9)
			ARRAY LONGINT:C221($_al_UniqueNumbers; 0)
			SELECTION TO ARRAY:C260($1->; $_al_UniqueNumbers)
			$_l_SizeofArray:=Size of array:C274($_al_UniqueNumbers)
		Else 
			ARRAY TEXT:C222($_at_UniqueCodes; 0)
			SELECTION TO ARRAY:C260($1->; $_at_UniqueCodes)
			$_l_SizeofArray:=Size of array:C274($_at_UniqueCodes)
		End if 
		
		
		ARRAY TEXT:C222($_at_UniqueCode; 0)
		For ($_l_Index; 1; $_l_SizeofArray)
			
			If ($3=9)
				$_t_UniqueCode:=$2+String:C10($_al_UniqueNumbers{$_l_Index})
			Else 
				$_t_UniqueCode:=$2+$_at_UniqueCodes{$_l_Index}
			End if 
			If ($_t_UniqueCode#"")
				APPEND TO ARRAY:C911($_at_UniqueCode; $_t_UniqueCode)
			End if 
		End for 
		If (Size of array:C274($_at_UniqueCode)>0)
			QUERY SELECTION WITH ARRAY:C1050([CUSTOM_FIELDS:98]Unique_Code:2; $_at_UniqueCode)
		End if 
		If ($3=9)
			ARRAY LONGINT:C221($_al_UniqueNumbers; 0)
		Else 
			ARRAY TEXT:C222($_at_UniqueCodes; 0)
		End if 
		
End case 
ERR_MethodTrackerReturn("StatsView_FFSS"; $_t_oldMethodName)
