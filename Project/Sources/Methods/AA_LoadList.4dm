//%attributes = {}

If (False:C215)
	//Project Method Name:      AA_LoadList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(AA_al_ListIDS;0)
	//ARRAY TEXT(AA_at_ListNames;0)
	C_BOOLEAN:C305($4; AA_bo_ListsInited)
	C_LONGINT:C283($_l_Delays; $_l_FieldNumber; $_l_ListID; $_l_OldListID; $_l_Retries; $_l_TableNumber; $0)
	C_POINTER:C301($_Ptr_ListIDArray; $_Ptr_ListIDs; $1; $2; $3; $5; $6; $7; $8)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_LoadList")

//NG Modified Feb 2004 to ensure a semaphore is set before list of lists is reloaded
$_t_oldMethodName:=ERR_MethodTracker("AA_LoadList")
$_l_Delays:=0
If (Not:C34(AA_bo_ListsInited))
	$_l_Retries:=0
	While (Semaphore:C143("$LoadingListofLists"))  //local to this machine
		$_l_Retries:=$_l_Retries+1
		DelayTicks(2*(1+$_l_Retries))
		$_l_Delays:=$_l_Delays+1
		If ($_l_Delays>10)
			DelayTicks(60)
		End if 
		
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


//AA_LoadList
//This method loads a list-by pointer

//``IMPORTANT MODIFICATION FOR Daybook
$_l_TableNumber:=Table:C252($1)
$_l_FieldNumber:=Field:C253($1)
$_l_ListID:=AA_GetListID($_l_TableNumber; $_l_FieldNumber)

//OLD    C_TEXT($1;$_t_ListName)
READ ONLY:C145([X_LISTS:111])
$0:=0
If (Count parameters:C259>=3)
	If ($_l_ListID=0)
		
	Else 
		$0:=$_l_ListID
		//$_t_ListName:=$1
		$_Ptr_ListIDArray:=$2
		$_Ptr_ListIDs:=$3
		ARRAY TEXT:C222($_Ptr_ListIDArray->; 0)
		ARRAY LONGINT:C221($_Ptr_ListIDs->; 0)
		$_l_OldListID:=$_l_ListID
		//$_l_ListID:=AA_LoadListName ($_l_ListID;"") `Do not see WHY this would be needed here
		
		
		Case of 
			: (Count parameters:C259=3)
				AA_LoadListbyID($_l_ListID; $2; $3)
			: (Count parameters:C259=4)
				AA_LoadListbyID($_l_ListID; $2; $3; $4)
			: (Count parameters:C259=5)
				AA_LoadListbyID($_l_ListID; $2; $3; $4; $5)
			: (Count parameters:C259>5)
				If (Count parameters:C259=8)
					AA_LoadListbyID($_l_ListID; $2; $3; $4; $5; $6; $7; $8)
				End if 
		End case 
		
	End if 
	
End if 
ERR_MethodTrackerReturn("AA_LoadList"; $_t_oldMethodName)
