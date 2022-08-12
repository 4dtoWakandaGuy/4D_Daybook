//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_LoadFilters
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    06/05/2011 09:50 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_FilterIDs;0)
	//ARRAY TEXT(DB_at_FilterNames;0)
	C_BOOLEAN:C305(DB_aB_FiltersInited)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_ContextNum; $_l_QueryMode; $_l_UserID; $1; $2; $3; $4; SM_l_QueryTable)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_LoadFilters")

//but if there are multiple Filter variant windows for the same table(such as JOBS)
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
	$_l_QueryMode:=1
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
	QUERY:C277([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_ContextID:3=$_l_ContextNum)  //Notice here that the filters settings are in the minus contexts so as not to interfer with search parameters
	QUERY SELECTION:C341([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_ID:1<0)
	QUERY SELECTION:C341([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_OwnerID:2=0; *)  //universal
	QUERY SELECTION:C341([x_QUERY_PARAMETERS:134];  | ; [x_QUERY_PARAMETERS:134]X_OwnerID:2=$_l_UserID)
	
	
	ARRAY TEXT:C222(DB_at_FilterNames; 0)
	ARRAY LONGINT:C221(DB_al_FilterIDs; 0)
	
	SELECTION TO ARRAY:C260([x_QUERY_PARAMETERS:134]Search_Name:4; DB_at_FilterNames; [x_QUERY_PARAMETERS:134]X_ID:1; DB_al_FilterIDs)
	SORT ARRAY:C229(DB_at_FilterNames; DB_al_FilterIDs)
	
	//INSERT IN ARRAY(DB_at_FilterNames;Size of array(DB_at_FilterNames)+1;5)
	//INSERT IN ARRAY(DB_al_FilterIDs;Size of array(DB_al_FilterIDs)+1;5)
	If (Size of array:C274(DB_at_FilterNames)>0)
		APPEND TO ARRAY:C911(DB_at_FilterNames; "-")
		APPEND TO ARRAY:C911(DB_al_FilterIDs; 99997)
	End if 
	//APPEND TO ARRAY(DB_at_FilterNames;Get localized string("SetDefaultfilter"))
	//APPEND TO ARRAY(DB_al_FilterIDs;-99998)
	
	//APPEND TO ARRAY(DB_at_FilterNames;Get localized string("DeleteFilter"))
	//APPEND TO ARRAY(DB_al_FilterIDs;-99999)
	
	//APPEND TO ARRAY(DB_at_FilterNames;Get localized string("Resave filter"))
	//APPEND TO ARRAY(DB_al_FilterIDs;0)
	
	APPEND TO ARRAY:C911(DB_at_FilterNames; Get localized string:C991("Save_Filter"))
	
	APPEND TO ARRAY:C911(DB_al_FilterIDs; 0)
	DB_at_FilterNames:=0
	DB_aB_FiltersInited:=True:C214
	
	
	
	
	
	
End if 
ERR_MethodTrackerReturn("DB_LoadFilters"; $_t_oldMethodName)