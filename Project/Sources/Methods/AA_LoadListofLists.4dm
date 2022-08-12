//%attributes = {}
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>WS_al_2dPropertyTypes;0;0)
	//ARRAY LONGINT(<>WS_al_ListAccessRights;0)
	//ARRAY LONGINT(<>WS_al_ListIDS;0)
	//ARRAY LONGINT(AA_al_aPropertyNum;0)
	//ARRAY LONGINT(AA_al_ListPropertiesNUM;0;0)
	//ARRAY LONGINT(AA_al_ListPropertyIDs;0)
	//ARRAY LONGINT(AA_al_ListPropertySublists;0)
	//ARRAY TEXT(<>DB_at_ListAttributes;0)
	//ARRAY TEXT(<>DB_at_ListNames;0)
	ARRAY TEXT:C222($_at_ListNames; 0)
	ARRAY TEXT:C222($_at_ListNamesTemp; 0)
	//ARRAY TEXT(AA_at_2DListPropertyTypes;0;0)
	//ARRAY TEXT(AA_at_APropertyNames;0)
	//ARRAY TEXT(AA_at_aPropertyValue;0)
	//ARRAY TEXT(AA_at_ListProperties;0)
	//ARRAY TEXT(AA_at_ListPropertiesSTR;0;0)
	//ARRAY TEXT(AA_at_PropertiesListProperties;0)
	C_BOOLEAN:C305(<>AA_bo_ListsDeclared; $_bo_OK)
	C_LONGINT:C283($_l_AccessNumber; $_l_arraySize; $_l_Delay; $_l_DuplicateRow; $_l_Index; $_l_Index2; $_l_Indexnstance; $_l_ListID; $_l_Properties; $_l_PropertyNum; $_l_Repeats)
	C_LONGINT:C283($_l_Retries)
	C_OBJECT:C1216($_obj_List; $_obj_ListProperties; $_obj_Lists)
	C_POINTER:C301($_ptr_ListIDArray; $1; $2; $3; $4; $5)
	C_TEXT:C284($_t_ListAttributes; $_t_oldMethodName; $_t_PropertiesList)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_LoadListofLists")


//NG Feb 2004 Modification to set  ◊AA_ListsDeclared:=True
//AA_LoadListofLists

$_l_Retries:=0
While (Semaphore:C143("$LoadingListofLists"))  //local to this machine
	$_l_Retries:=$_l_Retries+1
	DelayTicks(2*(1+$_l_Retries))
End while 



//This method loads data from the[X_Lists] table
//note there is a trigger on that table which clears these

If (Count parameters:C259<5)
	
	If (Application type:C494#4D Remote mode:K5:5)
		AA_CheckHeirarchical
	End if 
	
	
Else 
	ARRAY TEXT:C222($1->; 0)
	ARRAY LONGINT:C221($2->; 0)
	ARRAY TEXT:C222($3->; 0)
	ARRAY LONGINT:C221($4->; 0; 0)
	ARRAY LONGINT:C221($5->; 0)
End if 
ARRAY TEXT:C222(AA_at_ListProperties; 0)
ARRAY LONGINT:C221(AA_al_ListPropertyIDs; 0)
ARRAY LONGINT:C221(AA_al_ListPropertySublists; 0)

If (Application type:C494=4D Server:K5:6) | (Application type:C494<4)
	QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=0)
	If (Records in selection:C76([X_LISTS:111])>0)
		$_l_Retries:=0
		While (Semaphore:C143("LoadingListofLists"))  //about to write-stop everyone
			$_l_Retries:=$_l_Retries+1
			DelayTicks(2*(1+$_l_Retries))
		End while 
		READ WRITE:C146([X_LISTS:111])
		
		If (In transaction:C397)
			//an apply to selection causes probs if we are in a trnsaction
			For ($_l_Index; 1; Records in selection:C76([X_LISTS:111]))
				LOAD RECORD:C52([X_LISTS:111])
				$_bo_OK:=False:C215
				$_l_Repeats:=0
				$_l_Delay:=1
				Repeat 
					$_l_Repeats:=$_l_Repeats+1
					$_bo_OK:=Check_Locked(->[X_LISTS:111]; 1)
					If (Not:C34($_bo_OK))
						If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))  //only increase every 10 tries
							$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
						End if 
						DelayTicks(10*$_l_Delay)
					End if 
				Until ($_bo_OK)
				If ([X_LISTS:111]x_ID:1=0)
					[X_LISTS:111]x_ID:1:=AA_GetNextIDinMethod(->[X_LISTS:111]x_ID:1)
				End if 
				DB_SaveRecord(->[X_LISTS:111])
				AA_CheckFileUnlocked(->[X_LISTS:111]x_ID:1)
				NEXT RECORD:C51([X_LISTS:111])
			End for 
		Else 
			DB_lockFile(->[X_LISTS:111])
			APPLY TO SELECTION:C70([X_LISTS:111]; [X_LISTS:111]x_ID:1:=0)
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[X_LISTS:111]))
			
		End if 
		UNLOAD RECORD:C212([X_LISTS:111])
		READ ONLY:C145([X_LISTS:111])
		READ WRITE:C146([LIST_ITEMS:95])
		QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=0)
		If (In transaction:C397)  //an apply to selection causes probs if we are in a trnsaction
			For ($_l_Index; 1; Records in selection:C76([LIST_ITEMS:95]))
				LOAD RECORD:C52([LIST_ITEMS:95])
				$_bo_OK:=False:C215
				$_l_Repeats:=0
				$_l_Delay:=1
				Repeat 
					$_l_Repeats:=$_l_Repeats+1
					$_bo_OK:=Check_Locked(->[LIST_ITEMS:95]; 1)
					If (Not:C34($_bo_OK))
						If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))  //only increase every 10 tries
							$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
						End if 
						DelayTicks(10*$_l_Delay)
						
					End if 
				Until ($_bo_OK)
				If ([LIST_ITEMS:95]X_ID:3=0)
					[LIST_ITEMS:95]X_ID:3:=AA_GetNextIDinMethod(->[LIST_ITEMS:95]X_ID:3)
				End if 
				DB_SaveRecord(->[LIST_ITEMS:95])
				AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
				NEXT RECORD:C51([LIST_ITEMS:95])
			End for 
		Else 
			DB_lockFile(->[LIST_ITEMS:95])
			APPLY TO SELECTION:C70([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3:=0)
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[LIST_ITEMS:95]))
		End if 
		UNLOAD RECORD:C212([LIST_ITEMS:95])
		READ ONLY:C145([LIST_ITEMS:95])
		CLEAR SEMAPHORE:C144("LoadingListofLists")  //release everyone
	End if 
End if 
$_l_Retries:=0
While (Test semaphore:C652("LoadingListofLists"))
	$_l_Retries:=$_l_Retries+1
	DelayTicks(2*(1+$_l_Retries))
End while 

//BSW/NG both 29/08/03
If (Application type:C494=4D Server:K5:6) | (Application type:C494<4)
	If (Count parameters:C259=0)
		QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2="")
		If (Records in selection:C76([X_LISTS:111])>0)
			QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2="")
			If (Records in selection:C76([X_LISTS:111])>0)
				READ WRITE:C146([X_LISTS:111])
				For ($_l_Index; 1; Records in selection:C76([X_LISTS:111]))
					LOAD RECORD:C52([X_LISTS:111])
					[X_LISTS:111]x_ListName:2:="List"+String:C10([X_LISTS:111]x_ID:1)
					DB_SaveRecord(->[X_LISTS:111])
					AA_CheckFileUnlocked(->[X_LISTS:111]x_ID:1)
					NEXT RECORD:C51([X_LISTS:111])
				End for 
				UNLOAD RECORD:C212([X_LISTS:111])
				READ ONLY:C145([X_LISTS:111])
			End if 
			
		End if 
		ALL RECORDS:C47([X_LISTS:111])
		SELECTION TO ARRAY:C260([X_LISTS:111]x_ListName:2; $_at_ListNames)
		SORT ARRAY:C229($_at_ListNames; >)
		For ($_l_Index; 1; Size of array:C274($_at_ListNames))
			If ($_at_ListNames{$_l_Index}#"")
				$_l_DuplicateRow:=Find in array:C230($_at_ListNames; $_at_ListNames{$_l_Index}; $_l_Index+1)
				If ($_l_DuplicateRow>0)  //so we have 2 lists with same name problem
					READ WRITE:C146([X_LISTS:111])
					QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2=$_at_ListNames{$_l_Index})
					If (Records in selection:C76([X_LISTS:111])>1)
						FIRST RECORD:C50([X_LISTS:111])
						NEXT RECORD:C51([X_LISTS:111])
						$_l_Indexnstance:=2
						For ($_l_Index2; 2; Records in selection:C76([X_LISTS:111]))
							[X_LISTS:111]x_ListName:2:=[X_LISTS:111]x_ListName:2+String:C10($_l_Indexnstance)
							$_l_Indexnstance:=$_l_Indexnstance+1
							DB_SaveRecord(->[X_LISTS:111])
							AA_CheckFileUnlocked(->[X_LISTS:111]x_ID:1)
							NEXT RECORD:C51([X_LISTS:111])
						End for 
						
					End if 
					UNLOAD RECORD:C212([X_LISTS:111])
					READ ONLY:C145([X_LISTS:111])
					CLEAR SEMAPHORE:C144("LoadingListofLists")  //release everyone
				End if 
			End if 
			
		End for   //New section NG may 2004--convert unconverted lists
		QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4=0)
		If (Records in selection:C76([LIST_ITEMS:95])>0)
			ARRAY TEXT:C222($_at_ListNamesTemp; 0)
			DISTINCT VALUES:C339([LIST_ITEMS:95]List_Name:1; $_at_ListNamesTemp)
			For ($_l_Index; 1; Size of array:C274($_at_ListNamesTemp))
				If ($_at_ListNamesTemp{$_l_Index}#"")
					QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2=$_at_ListNamesTemp{$_l_Index})
					$_l_ListID:=0
					If (Records in selection:C76([X_LISTS:111])=0)
						READ WRITE:C146([X_LISTS:111])
						CREATE RECORD:C68([X_LISTS:111])
						[X_LISTS:111]x_ListName:2:=$_at_ListNamesTemp{$_l_Index}
						DB_SaveRecord(->[X_LISTS:111])
						AA_CheckFileUnlocked(->[X_LISTS:111]x_ID:1)
						$_l_ListID:=[X_LISTS:111]x_ID:1
						UNLOAD RECORD:C212([X_LISTS:111])
						READ ONLY:C145([X_LISTS:111])
					Else   //put the ID on the items
						$_l_ListID:=[X_LISTS:111]x_ID:1
					End if 
					If ($_l_ListID>0)
						READ WRITE:C146([LIST_ITEMS:95])
						QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]List_Name:1=$_at_ListNamesTemp{$_l_Index})
						APPLY TO SELECTION:C70([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4:=$_l_ListID)
						UNLOAD RECORD:C212([LIST_ITEMS:95])
						READ ONLY:C145([LIST_ITEMS:95])
					Else 
						READ WRITE:C146([LIST_ITEMS:95])
						QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]List_Name:1=$_at_ListNamesTemp{$_l_Index})
						APPLY TO SELECTION:C70([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4:=-1)  //so we do not look at them again!!
						UNLOAD RECORD:C212([LIST_ITEMS:95])
						READ ONLY:C145([LIST_ITEMS:95])
						
					End if 
					
				End if 
				
			End for 
			
		End if 
		//End of may 2004
	End if 
End if 
CLEAR SEMAPHORE:C144("LoadingListofLists")  //release everyone


If (Count parameters:C259<5)
	SELECTION TO ARRAY:C260([X_LISTS:111]x_ID:1; <>WS_al_ListIDS; [X_LISTS:111]x_ListName:2; <>DB_at_ListNames)
Else 
	SELECTION TO ARRAY:C260([X_LISTS:111]x_ID:1; $2->; [X_LISTS:111]x_ListName:2; $1->)
End if 

FIRST RECORD:C50([X_LISTS:111])
If (Count parameters:C259<5)
	ARRAY LONGINT:C221(<>WS_al_ListAccessRights; Size of array:C274(<>DB_at_ListNames))
Else 
	ARRAY LONGINT:C221($5->; Size of array:C274($1->))
End if 


//NOTE THE FOLLOWING IS 2D
If (Count parameters:C259<5)
	ARRAY LONGINT:C221(<>WS_al_2dPropertyTypes; Size of array:C274(<>DB_at_ListNames); 0)
Else 
	ARRAY LONGINT:C221($4->; Size of array:C274($1->); 0)
End if 

ARRAY TEXT:C222(AA_at_PropertiesListProperties; 0)
If (Count parameters:C259<5)
	$_ptr_ListIDArray:=-><>WS_al_2dPropertyTypes
Else 
	$_ptr_ListIDArray:=$4
End if 
If (Size of array:C274($_ptr_ListIDArray->)=0)
	ALL RECORDS:C47([X_LISTS:111])
	If (Count parameters:C259<5)
		SELECTION TO ARRAY:C260([X_LISTS:111]x_ID:1; <>WS_al_ListIDS; [X_LISTS:111]x_ListName:2; <>DB_at_ListNames)
	Else 
		SELECTION TO ARRAY:C260([X_LISTS:111]x_ID:1; $2->; [X_LISTS:111]x_ListName:2; $1->)
		
	End if 
	FIRST RECORD:C50([X_LISTS:111])
	If (Count parameters:C259<5)
		ARRAY LONGINT:C221(<>WS_al_ListAccessRights; Size of array:C274(<>DB_at_ListNames))
	Else 
		ARRAY LONGINT:C221($5->; Size of array:C274($1->))
		
	End if 
	
	//NOTE THE FOLLOWING IS 2D
	If (Count parameters:C259<5)
		ARRAY LONGINT:C221(<>WS_al_2dPropertyTypes; Size of array:C274(<>DB_at_ListNames); 0)
		ARRAY TEXT:C222(AA_at_PropertiesListProperties; 0)
	Else 
		ARRAY LONGINT:C221($4->; Size of array:C274($1->); 0)
		ARRAY TEXT:C222(AA_at_PropertiesListProperties; 0)
	End if 
	
End if 
QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2="List Properties")
If (Records in selection:C76([X_LISTS:111])=0)
	$_l_Retries:=0
	While (Semaphore:C143("LoadingListofLists"))  //about to write-stop everyone
		$_l_Retries:=$_l_Retries+1
		DelayTicks(2*(1+$_l_Retries))
	End while 
	QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2="List Properties")
	If (Records in selection:C76([X_LISTS:111])=0)
		
		READ WRITE:C146([X_LISTS:111])
		CREATE RECORD:C68([X_LISTS:111])
		[X_LISTS:111]x_ID:1:=AA_GetNextIDinMethod(->[X_LISTS:111]x_ID:1)
		[X_LISTS:111]x_ListName:2:="List Properties"
		DB_SaveRecord(->[X_LISTS:111])
		AA_CheckFileUnlocked(->[X_LISTS:111]x_ID:1)
	End if 
	$_l_ListID:=[X_LISTS:111]x_ID:1
	UNLOAD RECORD:C212([X_LISTS:111])
	READ ONLY:C145([X_LISTS:111])
	CLEAR SEMAPHORE:C144("LoadingListofLists")  //release everyone
Else 
	$_l_ListID:=[X_LISTS:111]x_ID:1
	UNLOAD RECORD:C212([X_LISTS:111])
End if 
QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4=$_l_ListID)
SELECTION TO ARRAY:C260([LIST_ITEMS:95]List_Entry:2; AA_at_ListProperties; [LIST_ITEMS:95]X_ID:3; AA_al_ListPropertyIDs)
ARRAY TEXT:C222(AA_at_PropertiesListProperties; Size of array:C274(AA_at_ListProperties))
ARRAY TEXT:C222(AA_at_2DListPropertyTypes; 0; 0)
ARRAY LONGINT:C221(AA_al_ListPropertiesNUM; 0; 0)
ARRAY TEXT:C222(AA_at_ListPropertiesSTR; 0; 0)
ARRAY TEXT:C222(AA_at_2DListPropertyTypes; Size of array:C274(AA_at_ListProperties); 0)
ARRAY LONGINT:C221(AA_al_ListPropertiesNUM; Size of array:C274(AA_at_ListProperties); 0)
ARRAY TEXT:C222(AA_at_ListPropertiesSTR; Size of array:C274(AA_at_ListProperties); 0)
For ($_l_Index; 1; Records in selection:C76([LIST_ITEMS:95]))
	If (BLOB size:C605([LIST_ITEMS:95]X_Revised_Attributes:9)>0)
		AA_GetListItemProperties(->AA_at_2DListPropertyTypes{$_l_Index}; ->AA_al_ListPropertiesNUM{$_l_Index}; ->AA_at_ListPropertiesSTR{$_l_Index})
	End if 
	NEXT RECORD:C51([LIST_ITEMS:95])
End for 
//`we need to know the sublists used by the properties
ARRAY LONGINT:C221(AA_al_ListPropertySublists; 0)
ARRAY LONGINT:C221(AA_al_ListPropertySublists; Size of array:C274(AA_at_PropertiesListProperties))
For ($_l_Index; 1; Size of array:C274(AA_at_2DListPropertyTypes))  //F2
	$_l_DuplicateRow:=Find in array:C230(AA_at_2DListPropertyTypes{$_l_Index}; "ACCESS")
	If ($_l_DuplicateRow>0)
		AA_al_ListPropertySublists{$_l_Index}:=AA_al_ListPropertiesNUM{$_l_Index}{$_l_DuplicateRow}
	Else 
		AA_al_ListPropertySublists{$_l_Index}:=0
	End if 
End for   //F2




$_t_ListAttributes:=""
If (Count parameters:C259<5)
	$_ptr_ListIDArray:=-><>WS_al_ListIDS
Else 
	$_ptr_ListIDArray:=$2
End if 

For ($_l_Index; 1; Size of array:C274($_ptr_ListIDArray->))  //F5
	$_obj_Lists:=ds:C1482.X_LISTS.query("x_ID =:1"; $_ptr_ListIDArray->{$_l_Index)
	If ($_obj_Lists.length>0)
		$_obj_List:=$_obj_Lists[0]
		//If (BLOB size($_obj_List.x_ListValues)
		$_obj_ListProperties:=New object:C1471
		$_obj_ListProperties:=$_obj_List.x_ListValues
		//$_obj_ListProperties.propertyNames
		//$_obj_ListProperties.propertyNumbers
		//$_obj_ListProperties.propertyValues
		//QUERY([X_LISTS]; [X_LISTS]x_ID=$_ptr_ListIDArray->{$_l_Index})
		ARRAY TEXT:C222(AA_at_APropertyNames; 0)
		ARRAY LONGINT:C221(AA_al_aPropertyNum; 0)
		ARRAY TEXT:C222(AA_at_aPropertyValue; 0)
		//AA_GetListProperties(->AA_at_APropertyNames; ->AA_al_aPropertyNum; ->AA_at_aPropertyValue)
		$_l_DuplicateRow:=Find in array:C230(AA_at_APropertyNames; "ACCESS")
		If ($_l_DuplicateRow>0)
			$_l_AccessNumber:=AA_al_aPropertyNum{$_l_DuplicateRow}
		Else 
			$_l_AccessNumber:=0
		End if 
		If (Count parameters:C259<5)
			<>WS_al_ListAccessRights{$_l_Index}:=$_l_AccessNumber
		Else 
			$5->{$_l_Index}:=$_l_AccessNumber
		End if 
		///End if 
	End if 
End for 
For ($_l_Properties; 1; Size of array:C274(AA_at_APropertyNames))
	If (AA_at_APropertyNames{$_l_Properties}#"Access")
		$_l_PropertyNum:=AA_al_aPropertyNum{$_l_Properties}
		If (Count parameters:C259<5)
			$_l_arraySize:=Size of array:C274(<>WS_al_2dPropertyTypes{$_l_Index})+1
			INSERT IN ARRAY:C227(<>WS_al_2dPropertyTypes{$_l_Index}; $_l_arraySize; 1)
			<>WS_al_2dPropertyTypes{$_l_DuplicateRow}{$_l_arraySize}:=$_l_PropertyNum
		Else 
			$_l_arraySize:=($4->{$_l_Index})+1
			INSERT IN ARRAY:C227($4->{$_l_Index}; $_l_arraySize; 1)
			$4->{$_l_Index}{$_l_arraySize}:=$_l_PropertyNum
		End if 
	End if 
End for 
//end F5
If (Count parameters:C259<5)
	ARRAY TEXT:C222(<>DB_at_ListAttributes; Size of array:C274(<>DB_at_ListNames))
	
	SORT ARRAY:C229(<>DB_at_ListNames; <>WS_al_ListIDS; <>DB_at_ListAttributes; <>WS_al_2dPropertyTypes; <>WS_al_ListAccessRights)
	
Else 
	ARRAY TEXT:C222($2->; Size of array:C274($1->))
	SORT ARRAY:C229($1->; $2->; $3->; $4->; $5->)
	
	
End if 
$_t_PropertiesList:=""
<>AA_bo_ListsDeclared:=True:C214
CLEAR SEMAPHORE:C144("$LoadingListofLists")
ERR_MethodTrackerReturn("AA_LoadListofLists"; $_t_oldMethodName)
