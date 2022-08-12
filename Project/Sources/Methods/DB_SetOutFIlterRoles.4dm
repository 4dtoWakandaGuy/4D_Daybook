//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetOutFIlterRoles
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/05/2013 20:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(LAY_abo_RoleExclude;0)
	//ARRAY BOOLEAN(LAY_abo_RoleInclude;0)
	//ARRAY BOOLEAN(LAY_lb_RLCodes;0)
	//ARRAY BOOLEAN(LAY_lb_SPCodes;0)
	//ARRAY TEXT(DB_at_RoleCodes;0)
	//ARRAY TEXT(DB_at_RoleNames;0)
	C_BOOLEAN:C305($_bo_ObjectExists; $_bo_SetReturnObjects; DB_bo_RolesReady; LAY_bo_RolesSetup)
	C_LONGINT:C283($_l_BestHeight; $_l_BestLabelHeight; $_l_BestLabelWidth; $_l_BestWidth; $_l_GetRoles; $_l_Index; $_l_Longest; $_l_MaxLabelWidth; $_l_MaxLBWidth; $_l_ObjectExists; $_l_Ref)
	C_LONGINT:C283($_l_TotalWidth; $0; ROLE_l_BUT1; ROLE_l_But2; ROLE_l_BUT3; ROLE_l_BUT4; ROLE_l_BUT5; ROLE_l_BUT6; ROLE_l_BUT7; ROLE_l_BUT8; ROLE_l_BUT9)
	C_POINTER:C301($_Ptr_AllListBoxPhySize; $_Ptr_CountListboxesToDisplay; $_Ptr_DisplayThisObject; $_Ptr_ListBoxRowCountArray; $_ptr_MaxLabelWidth; $_ptr_MaxLBWidth; $_ptr_ObjectExists; $_ptr_ObjectNameArray; $_ptr_objectNamedArray; $_Ptr_ObjectsToDisplay; $_Ptr_TableForStyle)
	C_POINTER:C301($1; $10; $11; $2; $3; $4; $5; $6; $7; $8; $9)
	C_TEXT:C284($_t_Label; $_t_OldMethodName; dbFilterText; ROLE_t_COL1; ROLE_t_COL2; ROLE_t_COL3; ROLE_t_COL4; ROLE_t_COL5; ROLE_t_COL6; ROLE_t_COL7; ROLE_t_COL8)
	C_TEXT:C284(ROLE_t_COL9; ROLE_t_HED1; ROLE_t_HED2; ROLE_t_HED3; ROLE_t_HED4; ROLE_t_HED5; ROLE_t_HED6; ROLE_t_HED7; ROLE_t_HED8; ROLE_t_HED9)
End if 

//Code Starts Here

$_t_OldMethodName:=ERR_MethodTracker("DB_SetOutFIlterRoles")
If (Count parameters:C259>=1)
	$_Ptr_TableForStyle:=$1
	If (Count parameters:C259>=11)
		$_bo_SetReturnObjects:=True:C214
		$_ptr_objectNamedArray:=$2
		$_ptr_ObjectExists:=$3
		$_ptr_ObjectNameArray:=$4
		$_Ptr_ObjectsToDisplay:=$5  //pointer to array of object to display
		$_Ptr_DisplayThisObject:=$6  //pointer to boolean indicating if this object is displayed
		
		$_ptr_MaxLBWidth:=$7  //
		$_l_MaxLBWidth:=$7->
		$_Ptr_CountListboxesToDisplay:=$8
		$_Ptr_AllListBoxPhySize:=$9
		$_Ptr_ListBoxRowCountArray:=$10
		$_ptr_MaxLabelWidth:=$11
		$_l_MaxLabelWidth:=$11->
		/////
		
		$_l_ObjectExists:=Find in array:C230($_ptr_objectNamedArray->; "Roles")  //this is not the name of the on screen object just a reference for this method
		If ($_l_ObjectExists<0)
			APPEND TO ARRAY:C911($_ptr_ObjectExists->; False:C215)
			APPEND TO ARRAY:C911($_ptr_ObjectNamedArray->; "Roles")
			APPEND TO ARRAY:C911($_ptr_ObjectNameArray->; "oRoles")
		End if 
		/////
		$_l_Ref:=Find in array:C230($_ptr_ObjectNameArray->; "Roles")
		If ($_l_Ref>0)
			$_bo_ObjectExists:=$_ptr_ObjectExists->{$_l_Ref}
			
		Else 
			$_bo_ObjectExists:=False:C215
		End if 
	Else 
		$_l_Ref:=-1
		$_bo_ObjectExists:=False:C215
	End if 
	
	
	If (Not:C34(LAY_bo_RolesSetup))
		If ($_bo_ObjectExists=False:C215)  //the object existence is different from the array existence-don't assume one means the other-just for safety
			ARRAY BOOLEAN:C223(LAY_lb_RLCodes; 0)
			
			OBJECT DUPLICATE:C1111(*; "oFilterLBObject"; "oRoles"; ->LAY_lb_RLCodes)
			OBJECT DUPLICATE:C1111(*; "oFilterLabel"; "oRolesLabel")
			$_t_Label:=Get localized string:C991("RolesFieldNames_RoleName")
			If (Position:C15(":"; $_t_Label)=0)
				$_t_Label:=$_t_Label+" :"
			End if 
			OBJECT SET TITLE:C194(*; "oRolesLabel"; $_t_Label)
		End if 
		
		DB_bo_RolesReady:=False:C215
		ARRAY TEXT:C222(DB_at_RoleNames; 0)
		ARRAY TEXT:C222(DB_at_RoleCodes; 0)
		$_l_GetRoles:=New process:C317("DB_GetRoles"; 128000; "Get Roles"; Current process:C322; True:C214)
		While (Not:C34(DB_bo_RolesReady))
			DelayTicks(2)
		End while 
		SORT ARRAY:C229(DB_at_RoleNames; DB_at_RoleCodes)
		If (Size of array:C274(DB_at_RoleNames)>0)
			INSERT IN ARRAY:C227(DB_at_RoleNames; 1; 1)
			INSERT IN ARRAY:C227(DB_at_RoleCodes; 1; 1)
			DB_at_RoleCodes{1}:=""
			DB_at_RoleNames{1}:="No Role"
		End if 
		ARRAY BOOLEAN:C223(LAY_abo_RoleInclude; 0)
		ARRAY BOOLEAN:C223(LAY_abo_RoleExclude; 0)
		ARRAY BOOLEAN:C223(LAY_abo_RoleInclude; Size of array:C274(DB_at_RoleNames))
		ARRAY BOOLEAN:C223(LAY_abo_RoleExclude; Size of array:C274(DB_at_RoleNames))
		For ($_l_Index; 1; Size of array:C274(DB_at_RoleNames))
			LAY_abo_RoleInclude{$_l_Index}:=True:C214
		End for 
		$_l_Longest:=0
		For ($_l_Index; 1; Size of array:C274(DB_at_RoleNames))
			dbFilterText:=DB_at_RoleNames{$_l_Index}
			OBJECT GET BEST SIZE:C717(*; "oFilterText"; $_l_BestWidth; $_l_BestHeight)
			If ($_l_BestWidth>$_l_Longest)
				$_l_Longest:=$_l_BestWidth
			End if 
		End for 
		$_l_Longest:=$_l_Longest+2
		Case of 
			: ($_l_Longest>(118))
				$_l_Longest:=(118)
			: ($_l_Longest<(60))
				$_l_Longest:=(60)
		End case 
		LB_SetupListboxByObjectName("oRoles"; "ROLE_t"; "ROLE_L"; 1; ->DB_at_RoleNames; ->DB_at_RoleCodes; ->LAY_abo_RoleInclude; ->LAY_abo_RoleExclude)
		LB_SetColumnHeadersByObjectName("oRoles"; "ROLE_L"; 1; "Role"; "Code"; "Include"; "Exclude")
		LB_SetEnterablebyObjectName("oRoles"; False:C215; 0)
		LB_SetEnterablebyObjectName("oRoles"; True:C214; 3)
		LB_SetEnterablebyObjectName("oRoles"; True:C214; 4)
		LB_SetColumnWIdthsByObjectName("oRoles"; "ROLE_t"; 1; $_l_Longest; 35; 35)
		LB_SetScrollByObjectName("oRoles"; -3; -2)
	End if 
	OBJECT GET BEST SIZE:C717(*; "oRolesLabel"; $_l_BestLabelWidth; $_l_BestLabelHeight)
	If ($_l_BestLabelWidth>$_l_MaxLabelWidth)
		$_l_MaxLabelWidth:=$_l_BestLabelWidth
	End if 
	LB_StyleSettingsByObjectName("oRoles"; "Black"; 9; "ROLE_t"; $1)
	LAY_bo_RolesSetup:=True:C214
	$0:=$_l_Longest+35+35
	
	$_l_TotalWidth:=LB_GetTotalColumnWIdths("oRoles")
	$0:=$_l_TotalWidth
	
	If ($_bo_SetReturnObjects)
		If (Size of array:C274(DB_at_RoleNames)>1)  //so we actually only show the area if there are some items in it
			If ($_l_TotalWidth>$_l_MaxLBWidth)
				$_l_MaxLBWidth:=$_l_TotalWidth
			End if 
			$_Ptr_CountListboxesToDisplay->:=$_Ptr_CountListboxesToDisplay->+1
			$_Ptr_AllListBoxPhySize->:=$_Ptr_AllListBoxPhySize->+(Size of array:C274(DB_at_RoleNames)*20)+20
			APPEND TO ARRAY:C911($_Ptr_ListBoxRowCountArray->; Size of array:C274(DB_at_RoleNames))
			$_Ptr_DisplayThisObject->:=True:C214
			APPEND TO ARRAY:C911($_Ptr_ObjectsToDisplay->; "Roles")
			$_ptr_MaxLBWidth->:=$_l_MaxLBWidth
			$_ptr_MaxLabelWidth->:=$_l_MaxLabelWidth
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("DB_SetOutFIlterRoles"; $_t_OldMethodName)