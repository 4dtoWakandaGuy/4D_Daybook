//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_LoaduserVisibleListNames
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/01/2012 23:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(AA_al_aallListIDS;0)
	//ARRAY LONGINT(AA_al_aPropertyNum;0)
	//ARRAY LONGINT(AA_al_ListIDS;0)
	//ARRAY TEXT(AA_at_aallListNames;0)
	//ARRAY TEXT(AA_at_APropertyNames;0)
	//ARRAY TEXT(AA_at_aPropertyValue;0)
	//ARRAY TEXT(AA_at_ListNames;0)
	C_BOOLEAN:C305($_bo_ListAllowed; AA_bo_ListsInited)
	C_LONGINT:C283($_l_access; $_l_access2; $_l_AccessPosition; $_l_Index; $_l_Retries)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_LoaduserVisibleListNames")
If (Count parameters:C259>=2)
	//This method will load the user visible list name(some lists are 'sublists' and some are designer/administrator only
	If (Not:C34(AA_bo_ListsInited))
		$_l_Retries:=0
		While (Semaphore:C143("$LoadingListofLists"))
			$_l_Retries:=$_l_Retries+1
			DelayTicks(2*(1+$_l_Retries))
		End while 
		ARRAY TEXT:C222(AA_at_ListNames; 0)
		ARRAY LONGINT:C221(AA_al_ListIDS; 0)
		ARRAY TEXT:C222(AA_at_aallListNames; 0)
		ARRAY LONGINT:C221(AA_al_aallListIDS; 0)
		AA_GetTopLevelListNames(->AA_al_ListIDS; ->AA_at_ListNames)
		//On THIS FORM we do need all the list IDs
		AA_bo_ListsInited:=True:C214
		CLEAR SEMAPHORE:C144("$LoadingListofLists")
	End if 
	//``
	For ($_l_Index; 1; Size of array:C274(AA_at_ListNames))
		//do not put in invisible ones
		$_bo_ListAllowed:=False:C215
		
		Case of 
			: (User in group:C338(Current user:C182; "Designer")) | (Current user:C182="Designer")
				$_l_access2:=4
			: (User in group:C338(Current user:C182; "administrator")) | (Current user:C182="Administrator")
				$_l_access2:=2
			Else 
				$_l_access2:=1
		End case 
		//Get this lists access rights
		QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=AA_al_ListIDS{$_l_Index})
		ARRAY TEXT:C222(AA_at_APropertyNames; 0)
		ARRAY LONGINT:C221(AA_al_aPropertyNum; 0)
		ARRAY TEXT:C222(AA_at_aPropertyValue; 0)
		AA_GetListProperties(->AA_at_APropertyNames; ->AA_al_aPropertyNum; ->AA_at_aPropertyValue)
		$_l_AccessPosition:=Find in array:C230(AA_at_APropertyNames; "ACCESS")
		If ($_l_AccessPosition>0)
			$_l_access:=AA_al_aPropertyNum{$_l_AccessPosition}
		Else 
			$_l_access:=0
		End if 
		
		Repeat 
			If (Not:C34($_l_access ?? 5))
				$_bo_ListAllowed:=($_l_access ?? $_l_access2)
				If (Not:C34($_bo_ListAllowed))
					$_l_access2:=$_l_access2-1
				End if 
				
				
			Else 
				$_l_access2:=-1
			End if 
		Until ($_l_access2<=0) | ($_bo_ListAllowed)
		Case of 
			: ($_bo_ListAllowed)
				APPEND TO ARRAY:C911($1->; AA_al_ListIDS{$_l_Index})
				APPEND TO ARRAY:C911($2->; AA_at_ListNames{$_l_Index})
			: ($_l_access=0)
				APPEND TO ARRAY:C911($1->; AA_al_ListIDS{$_l_Index})
				APPEND TO ARRAY:C911($2->; AA_at_ListNames{$_l_Index})
		End case 
		
	End for 
	
	//```
End if 
ERR_MethodTrackerReturn("AA_LoaduserVisibleListNames"; $_t_oldMethodName)