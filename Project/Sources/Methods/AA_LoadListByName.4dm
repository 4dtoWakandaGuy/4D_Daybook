//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_LoadListByName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2010/01/14 2:48 PM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(AA_al_ListIDS;0)
	//ARRAY TEXT(AA_at_ListNames;0)
	C_BOOLEAN:C305(<>AA_bo_ListsDeclared; $4; AA_bo_ListsInited)
	C_LONGINT:C283($_l_Delays; $_l_DelayTime; $_l_FieldNumber; $_l_ListID; $_l_Retries; $_l_TableNumber; $0)
	C_POINTER:C301($_ptr_ListIDS; $_ptr_ListValues; $2; $3; $5; $6; $7; $8; $9)
	C_TEXT:C284($_t_DataTypeString; $_t_ListName; $_t_OldListName; $_t_oldMethodName; $_t_VariableName; $1; AA_t_CallingMethod; DB_t_Methodname)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("AA_LoadListByName"; 0; $1)
//NG Modified Feb 2004 to ensure a semaphore is set before list of lists is reloaded
//AA_LoadListByName
//This method loads a list-by name

DB_t_Methodname:=Current method name:C684
$_l_Delays:=0
$_l_DelayTime:=6
$0:=0

If (Not:C34(AA_bo_ListsInited))
	$_l_Retries:=0
	While (Semaphore:C143("$LoadingListofLists"))
		$_l_Retries:=$_l_Retries+1
		DelayTicks(2*(1+$_l_Retries))
	End while 
	
	ARRAY TEXT:C222(AA_at_ListNames; 0)
	ARRAY LONGINT:C221(AA_al_ListIDS; 0)
	//ARRAY STRING(55;AA_at_aallListNames;0)
	//ARRAY LONGINT(AA_al_aallListIDS;0)
	
	AA_GetTopLevelListNames(->AA_al_ListIDS; ->AA_at_ListNames)
	
	//On THIS FORM we do need all the list IDs
	//ALL RECORDS([x_Lists])
	//SELECTION TO ARRAY([x_Lists]x_ID;AA_al_aallListIDs;[x_Lists]x_ListName;AA_at_aallListNames)
	
	AA_bo_ListsInited:=True:C214
	CLEAR SEMAPHORE:C144("$LoadingListofLists")
End if 

READ ONLY:C145([X_LISTS:111])
If (Count parameters:C259>=3)
	
	If ($1="")
		
		Gen_Alert("ERROR IN AA_LOADLISTBYNAME")
	Else 
		
		$_t_ListName:=$1
		$_ptr_ListValues:=$2
		$_ptr_ListIDS:=$3
		If (GenValidatePointer($2)) & (GenValidatePointer($3))
			
			
			If (Type:C295($_ptr_ListIDS->)#16)
				
				$_t_DataTypeString:=String:C10(Type:C295($_ptr_ListIDS->))
				RESOLVE POINTER:C394($3; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
				// ALERT("TYPE CHANGE -In AA_LoadListbyName loading "+$1+" "+$_t_VariableName+" Is type "+$_t_DataTypeString)
				ARRAY LONGINT:C221($2->; 0)
				ARRAY TEXT:C222($3->; 0)
				
			End if 
			
			
			$_t_OldListName:=$_t_ListName
			
			$_l_ListID:=AA_LoadListName(0; $_t_ListName)
			
			$0:=$_l_ListID
			Case of 
				: (Count parameters:C259=3)
					
					AA_LoadListbyID($_l_ListID; $2; $3)
				: (Count parameters:C259=4)
					
					AA_LoadListbyID($_l_ListID; $2; $3; $4)
				: (Count parameters:C259=5)
					
					AA_LoadListbyID($_l_ListID; $2; $3; $4; $5)
				: (Count parameters:C259=8)
					
					AA_LoadListbyID($_l_ListID; $2; $3; $4; $5; $6; $7; $8)
					
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
ERR_MethodTrackerReturn("AA_LoadListByName"; $_t_oldMethodName)
