//%attributes = {}

If (False:C215)
	//Project Method Name:      DBWS_MenutoJSON
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
	//ARRAY TEXT(DB_at_menuitem;0)
	//ARRAY TEXT(DB_at_MenuItem4DFunction;0)
	//ARRAY TEXT(DBWS_at_4DFunctionNames;0)
	//ARRAY TEXT(DBWS_at_WebPageFunction;0)
	C_BOOLEAN:C305(DBWS_bo_SwitchCallsInited)
	C_LONGINT:C283($_l_FunctionRow; $_l_ItemsIndex; $_l_SectionItemsCount; $_l_TotalItemsCount; $_l_TotalMenus; DBWS_l_menuRef)
	C_TEXT:C284($_t_DropDownJSONString; $_t_MenuBar; $_t_MenuTItle; $_t_oldMethodName; $0; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBWS_MenutoJSON")

$_t_MenuTItle:=$1
If (Not:C34(DBWS_bo_SwitchCallsInited))
	DBWS_4DtoJS
	DBWS_bo_SwitchCallsInited:=True:C214
End if 
DBWS_l_menuRef:=DBWS_l_menuRef+1
//note the above is self advancing just init at zero
$_l_SectionItemsCount:=0
$_l_TotalItemsCount:=0
$_t_DropDownJSONString:=""
$_l_TotalMenus:=0
For ($_l_ItemsIndex; 1; Size of array:C274(DB_at_menuitem))
	If (DB_at_MenuItem4DFunction{$_l_ItemsIndex}#"")
		$_l_FunctionRow:=Find in array:C230(DBWS_at_4DFunctionNames; DB_at_MenuItem4DFunction{$_l_ItemsIndex})
		If ($_l_FunctionRow>0)
			If ($_t_DropDownJSONString#"")  //append the string
				$_t_DropDownJSONString:=$_t_DropDownJSONString+",{"+Char:C90(34)+"value"+Char:C90(34)+":"+Char:C90(34)+DB_at_menuitem{$_l_ItemsIndex}+Char:C90(34)+","+Char:C90(34)+"onclick"+Char:C90(34)+":"+Char:C90(34)+DBWS_at_WebPageFunction{$_l_FunctionRow}+Char:C90(34)+"}"
				
			Else 
				//start the string
				
				$_t_DropDownJSONString:="{"+Char:C90(34)+"value"+Char:C90(34)+":"+Char:C90(34)+DB_at_menuitem{$_l_ItemsIndex}+Char:C90(34)+","+Char:C90(34)+"onclick"+Char:C90(34)+":"+Char:C90(34)+DBWS_at_WebPageFunction{$_l_FunctionRow}+Char:C90(34)+"}"
			End if 
			$_l_TotalItemsCount:=$_l_TotalItemsCount+1
			$_l_SectionItemsCount:=$_l_SectionItemsCount+1
		End if 
	Else 
		//no function-must be a seperator..only put it it in there are items...
		If ($_l_SectionItemsCount>0)
			$_t_DropDownJSONString:=$_t_DropDownJSONString+",{"+Char:C90(34)+"value"+Char:C90(34)+":"+Char:C90(34)+DB_at_menuitem{$_l_ItemsIndex}+Char:C90(34)+","+Char:C90(34)+"onclick"+Char:C90(34)+":"+Char:C90(34)+""+Char:C90(34)+"}"
			
			$_l_TotalItemsCount:=$_l_TotalItemsCount+1
		End if 
		$_l_SectionItemsCount:=0
	End if 
	
	
End for 
If ($_l_TotalItemsCount>0)
	$_t_DropDownJSONString:="{"+Char:C90(34)+"menuitem"+Char:C90(34)+": ["+$_t_DropDownJSONString+"]"+"}"
	$_t_DropDownJSONString:="{"+Char:C90(34)+"id"+Char:C90(34)+":"+Char:C90(34)+$_t_MenuTItle+Char:C90(34)+","+Char:C90(34)+"value"+Char:C90(34)+":"+Char:C90(34)+$_t_MenuTItle+Char:C90(34)+","+Char:C90(34)+"popup"+Char:C90(34)+":"+$_t_DropDownJSONString+"}"
	$_l_TotalMenus:=$_l_TotalMenus+1
End if 
If ($_l_TotalMenus>0)
	If ($_t_MenuBar#"")
		$_t_MenuBar:=$_t_MenuBar+","+$_t_DropDownJSONString
	Else 
		$_t_MenuBar:=$_t_DropDownJSONString
	End if 
	If (Count parameters:C259=0) | ($2="")
		$_t_MenuBar:=Char:C90(34)+"menu"+String:C10(DBWS_l_menuRef)+Char:C90(34)+":"+$_t_MenuBar
	Else 
		$_t_MenuBar:=$2+","+Char:C90(34)+"menu"+String:C10(DBWS_l_menuRef)+Char:C90(34)+":"+$_t_MenuBar
	End if 
Else 
	If ($2#"")
		$_t_MenuBar:=$2
	End if 
End if 
//note that the total menubar will need "{"+ and "}" added and susequent menus are added to it..
$0:=$_t_MenuBar
ERR_MethodTrackerReturn("DBWS_MenutoJSON"; $_t_oldMethodName)