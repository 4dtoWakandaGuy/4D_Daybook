//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_LoadSearchParameterNames
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/03/2010 21:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SM_al_SearchIDs;0)
	//ARRAY TEXT(SM_at_SearchNames;0)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_ContextNum; $_l_QueryMode; $_l_UserID; $1; $2; $3; $4; SM_l_QueryTable)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SM_LoadSearchParameterNames")
//but if there are multiple search windows for the same table(such as JOBS)
//then add to the number by passing $2
If (Count parameters:C259>=1)
	If (Count parameters:C259>=3)
		If ($3>0)
			$_l_ContextNum:=($1*255)+$3  //This gives up to 255 contexts per table!
		Else 
			$_l_ContextNum:=$1
		End if 
	Else 
		$_l_ContextNum:=$1
	End if 
	$_l_QueryMode:=0
	If (Count parameters:C259>=2)
		$_l_QueryMode:=$2
	End if 
	If (Count parameters:C259>=4)
		$_l_UserID:=$4
	Else 
		$_l_UserID:=<>PER_l_CurrentUserID
	End if 
	SM_l_QueryTable:=$1
	READ ONLY:C145([x_QUERY_PARAMETERS:134])
	QUERY:C277([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_ContextID:3=$_l_ContextNum)
	QUERY SELECTION:C341([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_ID:1>0)
	QUERY SELECTION:C341([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_OwnerID:2=0; *)  //universal
	QUERY SELECTION:C341([x_QUERY_PARAMETERS:134];  | ; [x_QUERY_PARAMETERS:134]X_OwnerID:2=$_l_UserID)
	
	
	ARRAY TEXT:C222(SM_at_SearchNames; 0)
	ARRAY LONGINT:C221(SM_al_SearchIDs; 0)
	
	SELECTION TO ARRAY:C260([x_QUERY_PARAMETERS:134]Search_Name:4; SM_at_SearchNames; [x_QUERY_PARAMETERS:134]X_ID:1; SM_al_SearchIDs)
	SORT ARRAY:C229(SM_at_SearchNames; SM_al_SearchIDs)
	Case of 
		: ($_l_QueryMode=0)  // IF WE ARE EDITING OR CREATING A SET MANAGER SEARCH DISABLE THESE
			INSERT IN ARRAY:C227(SM_at_SearchNames; Size of array:C274(SM_at_SearchNames)+1; 5)
			INSERT IN ARRAY:C227(SM_al_SearchIDs; Size of array:C274(SM_al_SearchIDs)+1; 5)
			
			SM_at_SearchNames{Size of array:C274(SM_at_SearchNames)-4}:="-"
			SM_al_SearchIDs{Size of array:C274(SM_at_SearchNames)-4}:=-99997
			SM_at_SearchNames{Size of array:C274(SM_at_SearchNames)-3}:=Get localized string:C991("SetDefaultParameters")
			SM_al_SearchIDs{Size of array:C274(SM_at_SearchNames)-3}:=-99998
			
			SM_at_SearchNames{Size of array:C274(SM_at_SearchNames)-2}:=Get localized string:C991("DeleteSearchParameters")
			SM_al_SearchIDs{Size of array:C274(SM_at_SearchNames)-2}:=-99999
			SM_at_SearchNames{Size of array:C274(SM_at_SearchNames)-1}:=Get localized string:C991("ResaveSearchparameters")
			SM_al_SearchIDs{Size of array:C274(SM_at_SearchNames)-1}:=0
			
			SM_at_SearchNames{Size of array:C274(SM_at_SearchNames)}:=Get localized string:C991("SaveQueryparameters")
			
			SM_at_SearchNames:=0
		: ($_l_QueryMode=1)  //'Filters
			INSERT IN ARRAY:C227(SM_at_SearchNames; Size of array:C274(SM_at_SearchNames)+1; 5)
			INSERT IN ARRAY:C227(SM_al_SearchIDs; Size of array:C274(SM_al_SearchIDs)+1; 5)
			
			SM_at_SearchNames{Size of array:C274(SM_at_SearchNames)-4}:="-"
			SM_al_SearchIDs{Size of array:C274(SM_at_SearchNames)-4}:=-99997
			SM_at_SearchNames{Size of array:C274(SM_at_SearchNames)-3}:=Get localized string:C991("SetDefaultfilter")
			SM_al_SearchIDs{Size of array:C274(SM_at_SearchNames)-3}:=-99998
			
			SM_at_SearchNames{Size of array:C274(SM_at_SearchNames)-2}:=Get localized string:C991("DeleteFilter")
			SM_al_SearchIDs{Size of array:C274(SM_at_SearchNames)-2}:=-99999
			SM_at_SearchNames{Size of array:C274(SM_at_SearchNames)-1}:=Get localized string:C991("Resave filter")
			SM_al_SearchIDs{Size of array:C274(SM_at_SearchNames)-1}:=0
			
			SM_at_SearchNames{Size of array:C274(SM_at_SearchNames)}:=Get localized string:C991("Save_Filter")
			
			SM_at_SearchNames:=0
			
		: ($_l_QueryMode=-1)  //Not called Search-Setting up a group
			INSERT IN ARRAY:C227(SM_at_SearchNames; Size of array:C274(SM_at_SearchNames)+1; 4)
			INSERT IN ARRAY:C227(SM_al_SearchIDs; Size of array:C274(SM_al_SearchIDs)+1; 4)
			
			SM_at_SearchNames{Size of array:C274(SM_at_SearchNames)-3}:="-"
			SM_al_SearchIDs{Size of array:C274(SM_at_SearchNames)-3}:=-99997
			
			SM_at_SearchNames{Size of array:C274(SM_at_SearchNames)-2}:=Get localized string:C991("DeleteGrouping")
			SM_al_SearchIDs{Size of array:C274(SM_at_SearchNames)-2}:=-99999
			SM_at_SearchNames{Size of array:C274(SM_at_SearchNames)-1}:=Get localized string:C991("Resavegrouping")
			SM_al_SearchIDs{Size of array:C274(SM_at_SearchNames)-1}:=0
			
			SM_at_SearchNames{Size of array:C274(SM_at_SearchNames)}:=Get localized string:C991("Savegrouping")
			
			SM_at_SearchNames:=0
			
	End case 
	
	
	
	
End if 
ERR_MethodTrackerReturn("SM_LoadSearchParameterNames"; $_t_oldMethodName)
