//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_LoadOwnedListByName
	//------------------ Method Notes ------------------
	//Based on AA_LoadListbyName this loads a list OWNED by the current connected data owner ID(allowing multiple data owners in the same system)
	//This is a transitional method to enable this change without damaging the existing data
	
	//------------------ Revision Control ----------------
	//Date Created: 04/09/2012 11:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(AA_al_ListIDS;0)
	//ARRAY TEXT(AA_at_ListNames;0)
	C_BOOLEAN:C305(<>AA_bo_ListsDeclared; $5; AA_bo_ListsInited)
	C_LONGINT:C283($_l_Delays; $_l_DelayTime; $_l_FieldNumber; $_l_ListID; $_l_Retries; $_l_TableNumber; $0; $1)
	C_POINTER:C301($_ptr_IDS; $_ptr_ListString; $10; $3; $4; $6; $7; $8; $9; $PROPERTYPOINTER)
	C_TEXT:C284($_t_ListName; $_t_ListNameOLD; $_t_oldMethodName; $_t_TypeArray; $_t_VariableName; $2; AA_t_CallingMethod; DB_t_Methodname)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_LoadOwnedListByName")


DB_t_Methodname:=Current method name:C684
$_l_Delays:=0
$_l_DelayTime:=6
$0:=0
//$Name:=Process_Name (Current process)
//MESSAGE("ListLoadOwnedby"+$Name)


If (Not:C34(AA_bo_ListsInited))
	$_l_Retries:=0
	While (Semaphore:C143("$LoadingListofLists"))
		$_l_Retries:=$_l_Retries+1
		DelayTicks(2*(1+$_l_Retries))
	End while 
	
	ARRAY TEXT:C222(AA_at_ListNames; 0)
	ARRAY LONGINT:C221(AA_al_ListIDS; 0)
	
	AA_GetOwnedTopLevelListNames($1; ->AA_al_ListIDS; ->AA_at_ListNames)
	
	AA_bo_ListsInited:=True:C214
	CLEAR SEMAPHORE:C144("$LoadingListofLists")
End if 

READ ONLY:C145([X_LISTS:111])
If (Count parameters:C259>=3)
	
	If ($2="")
		
		Gen_Alert("ERROR IN AA_LOADLISTBYNAME")
	Else 
		
		$_t_ListName:=$2
		$_ptr_ListString:=$3
		$_ptr_IDS:=$4
		If (GenValidatePointer($3)) & (GenValidatePointer($4))
			
			
			If (Type:C295($_ptr_IDS->)#16)
				$_t_TypeArray:=String:C10(Type:C295($_ptr_IDS->))
				RESOLVE POINTER:C394($4; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
				ALERT:C41("TYPE CHANGE -In AA_LoadOwnedListbyName loading "+$2+" "+$_t_VariableName+" Is type "+$_t_TypeArray)
				
				
			End if 
			
			//ARRAY STRING(55;$_ptr_ListString->;0)
			//ARRAY LONGINT($_ptr_IDS->;0)
			$_t_ListNameOLD:=$_t_ListName
			
			$_l_ListID:=AA_LoadOwnedListName($1; 0; $_t_ListName)
			
			$0:=$_l_ListID
			Case of 
				: (Count parameters:C259=4)
					
					AA_LoadOwnedListByID($1; $_l_ListID; $3; $4)
				: (Count parameters:C259=5)
					
					AA_LoadOwnedListByID($1; $_l_ListID; $3; $4; $5)
				: (Count parameters:C259=6)
					
					AA_LoadOwnedListByID($1; $_l_ListID; $3; $4; $5; $6)
				: (Count parameters:C259=7)
					
					AA_LoadOwnedListByID($1; $_l_ListID; $3; $4; $5; $6; $7; $8; $9)
					
			End case 
			
		Else 
			If (AA_t_CallingMethod#"")
				Gen_Alert("Serious Problem in AA_LoadListbyName, when called from "+AA_t_CallingMethod)
			Else 
				
				Gen_Alert("Serious Problem in AA_LoadListbyName, when called from "+$_t_oldMethodName)
			End if 
			$0:=0
			
		End if 
	End if 
	//ALERT("!")
	
End if 
ERR_MethodTrackerReturn("AA_LoadOwnedListByName"; $_t_oldMethodName)