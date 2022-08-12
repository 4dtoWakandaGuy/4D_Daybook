//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_AppendInputMenu
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  29/10/2010 06:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(DB_at_ModuleMenuNames;0)
	//ARRAY TEXT(DB_at_ModuleMenuReferences;0)
	C_LONGINT:C283($_l_CountMenuItems; $_l_Iindex; $1)
	C_TEXT:C284($_t_oldMethodName; DB_t_CUrrentMenuReference)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_AppendInputMenu")
If (Count parameters:C259>=1)
	If ($1#0)
		SET MENU BAR:C67($1)
	End if 
	DB_t_CUrrentMenuReference:=Get menu bar reference:C979
	$_l_CountMenuItems:=Count menu items:C405(DB_t_CUrrentMenuReference)
	If (Size of array:C274(DB_at_ModuleMenuReferences)>0)
		For ($_l_Iindex; 1; Size of array:C274(DB_at_ModuleMenuReferences))
			INSERT MENU ITEM:C412(DB_t_CUrrentMenuReference; $_l_CountMenuItems+1; DB_at_ModuleMenuNames{$_l_Iindex}; DB_at_ModuleMenuReferences{$_l_Iindex})
			$_l_CountMenuItems:=$_l_CountMenuItems+1
		End for 
	End if 
End if 
ERR_MethodTrackerReturn("DB_AppendInputMenu"; $_t_oldMethodName)