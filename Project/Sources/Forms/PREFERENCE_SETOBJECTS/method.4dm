
If (False:C215)
	//Project Method Name:      PREFERENCE_SETOBJECTS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  27/02/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_PropertyTypes; 0)
	ARRAY TEXT:C222($_at_Labels; 0)
	ARRAY TEXT:C222($_at_propertyNames; 0)
	ARRAY TEXT:C222($_at_Values; 0)
	C_LONGINT:C283($_l_BaseDatalHeight; $_l_BaseDataWIdth; $_l_BaseLabelHeight; $_l_BaseLabelWIdth; $_l_BestHeight; $_l_BestWidth; $_l_ButtonBottom; $_l_ButtonHeight; $_l_ButtonLeft; $_l_ButtonRight; $_l_ButtonTop)
	C_LONGINT:C283($_l_ButtonWidth; $_l_CreateObjects; $_l_DaataWidth; $_l_DataBottom; $_l_DataLeft; $_l_DatalLeft; $_l_DatalRight; $_l_DataNewLeft; $_l_DataRight; $_l_DataTop; $_l_DataWidth)
	C_LONGINT:C283($_l_FormEvent; $_l_HorizontalMove; $_l_LabelBottom; $_l_LabelLeft; $_l_LabelRight; $_l_LabelTop; $_l_LabelWidth; $_l_ObectNumber; $_l_Offset; $_l_Position; $_l_Resize)
	C_LONGINT:C283($_l_TextSize; $_l_WIndowBottom; $_l_WIndowLeft; $_l_WindowRight; $_l_WindowTop; $_l_WindowWidth)
	C_OBJECT:C1216(DB_obj_Interface)
	C_POINTER:C301($_ptr_Nil; $_ptr_ThisVar)
	C_TEXT:C284($_t_LastObjectName; $_t_oldMethodName; PREF_t_Data; PREF_t_Data1; PREF_t_Data2; PREF_t_Data3)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM PREFERENCE_SETOBJECTS"; Form event code:C388)

$_l_FormEvent:=Form event code:C388
Case of 
	: ($_l_FormEvent=On Load:K2:1)
		///ths new form just relies on one object DB_obj_Interface this will tell us every thing we need to set up the form
		//at this moment the first usage involves a list of labels and a list of values.
		//note that i would think we would add a possibility of a listbox interface, drop down menus
		//different data types etc
		PREF_t_Data1:=""
		PREF_t_Data2:=""
		PREF_t_Data3:=""
		OB GET PROPERTY NAMES:C1232(DB_obj_Interface; $_at_propertyNames; $_al_PropertyTypes)
		$_l_Position:=Find in array:C230($_at_propertyNames; "WindowTitle")
		If ($_l_Position>0)
			SET WINDOW TITLE:C213(OB Get:C1224(DB_obj_Interface; "WindowTitle"))
			
		End if 
		$_l_Position:=Find in array:C230($_at_propertyNames; "Labels")
		If ($_l_Position>0)
			ARRAY TEXT:C222($_at_Labels; 0)
			ARRAY TEXT:C222($_at_Values; 0)
			OB GET ARRAY:C1229(DB_obj_Interface; "Labels"; $_at_Labels)
			$_l_Position:=Find in array:C230($_at_propertyNames; "Values")
			If ($_l_Position>0)
				OB GET ARRAY:C1229(DB_obj_Interface; "Values"; $_at_Values)
			End if 
			ARRAY TEXT:C222($_at_Values; Size of array:C274($_at_Labels))
			//Now we create the objects on Screen
			$_l_ObectNumber:=1
			$_l_Offset:=0
			OBJECT GET COORDINATES:C663(*; "oLabelText"; $_l_LabelLeft; $_l_LabelTop; $_l_LabelRight; $_l_LabelBottom)
			//the first thing we are going to do is work out the width needed for the labels and data
			$_l_BaseLabelWIdth:=$_l_LabelRight-$_l_LabelLeft
			$_l_BaseLabelHeight:=$_l_LabelBottom-$_l_LabelTop
			$_l_LabelWidth:=100
			$_l_DataWidth:=200
			OBJECT GET COORDINATES:C663(*; "oVariableText"; $_l_DataLeft; $_l_DataTop; $_l_DataRight; $_l_DataBottom)
			$_l_BaseDataWIdth:=$_l_DataRight-$_l_DataLeft
			$_l_BaseDatalHeight:=$_l_DataBottom-$_l_DataTop
			
			
			For ($_l_TextSize; 1; Size of array:C274($_at_Labels))
				PREF_t_Data:=$_at_Labels{$_l_TextSize}+" :"
				OBJECT GET BEST SIZE:C717(*; "oVariableText"; $_l_BestWidth; $_l_BestHeight)
				If ($_l_BestWidth>$_l_LabelWidth)
					$_l_LabelWidth:=$_l_BestWidth
				End if 
				PREF_t_Data:=$_at_Values{$_l_TextSize}
				OBJECT GET BEST SIZE:C717(*; "oVariableText"; $_l_BestWidth; $_l_BestHeight)
				If ($_l_BestWidth>$_l_DataWidth)
					$_l_DataWidth:=$_l_BestWidth
				End if 
			End for 
			PREF_t_Data:=""
			$_l_Offset:=0
			GET WINDOW RECT:C443($_l_WIndowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WIndowBottom)
			$_l_WindowWidth:=$_l_WindowRight-$_l_WIndowLeft
			For ($_l_CreateObjects; 1; Size of array:C274($_at_Labels))
				If ($_l_BaseLabelWIdth>$_l_LabelWidth)
					$_l_Resize:=-($_l_BaseLabelWIdth-$_l_LabelWidth)
				Else 
					$_l_Resize:=$_l_LabelWidth-$_l_BaseLabelWIdth
				End if 
				OBJECT DUPLICATE:C1111(*; "oLabelText"; "oLabelText"+String:C10($_l_ObectNumber); $_ptr_Nil; ""; 0; 0+$_l_Offset; $_l_Resize)
				OBJECT GET COORDINATES:C663(*; "oLabelText"+String:C10($_l_ObectNumber); $_l_LabelLeft; $_l_LabelTop; $_l_LabelRight; $_l_LabelBottom)
				OBJECT SET TITLE:C194(*; "oLabelText"+String:C10($_l_ObectNumber); $_at_Labels{$_l_CreateObjects}+" :")
				$_l_DataNewLeft:=$_l_LabelRight+10
				If ($_l_DataLeft<$_l_DataNewLeft)
					$_l_HorizontalMove:=$_l_DataNewLeft-$_l_DataLeft
				Else 
					$_l_HorizontalMove:=-($_l_DataLeft-$_l_DataNewLeft)
				End if 
				If (($_l_DataNewLeft+$_l_DataWidth)<($_l_WindowWidth-10))
					//$_l_DataWidth:=($_l_WindowWidth-80)-$_l_DataNewLeft
				End if 
				If ($_l_BaseDataWIdth>$_l_DataWidth)
					$_l_Resize:=-($_l_BaseDataWIdth-$_l_DataWidth)
				Else 
					$_l_Resize:=$_l_DataWidth-$_l_BaseDataWIdth
				End if 
				$_ptr_ThisVar:=Get pointer:C304("PREF_t_Data"+String:C10($_l_CreateObjects))
				If ($_l_CreateObjects=1)
					OBJECT DUPLICATE:C1111(*; "oVariableText"; "oVariableText"+String:C10($_l_ObectNumber); $_ptr_ThisVar; Object first in entry order:K67:1; $_l_HorizontalMove; 0+$_l_Offset; $_l_Resize)
					//$_ptr_Nil:=OBJECT Get pointer(Object named;"oVariableText"+String($_l_ObectNumber))
					$_t_LastObjectName:="oVariableText"+String:C10($_l_ObectNumber)
				Else 
					OBJECT DUPLICATE:C1111(*; "oVariableText"; "oVariableText"+String:C10($_l_ObectNumber); $_ptr_ThisVar; $_t_LastObjectName; $_l_HorizontalMove; 0+$_l_Offset; $_l_Resize)
					$_t_LastObjectName:="oVariableText"+String:C10($_l_ObectNumber)
				End if 
				OBJECT GET COORDINATES:C663(*; "oVariableText"+String:C10($_l_ObectNumber); $_l_DatalLeft; $_l_DataTop; $_l_DataRight; $_l_DataBottom)
				$_l_ObectNumber:=$_l_ObectNumber+1
				$_l_Offset:=$_l_Offset+$_l_BaseLabelHeight+10
			End for 
			GET WINDOW RECT:C443($_l_WIndowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WIndowBottom)
			OBJECT GET COORDINATES:C663(*; "oButtonSave"; $_l_ButtonLeft; $_l_ButtonTop; $_l_ButtonRight; $_l_ButtonBottom)
			$_l_ButtonHeight:=$_l_ButtonBottom-$_l_ButtonTop
			$_l_ButtonWidth:=$_l_ButtonRight-$_l_ButtonLeft
			SET WINDOW RECT:C444($_l_WIndowLeft; $_l_WindowTop; $_l_WIndowLeft+$_l_DataRight+10; $_l_WindowTop+($_l_DataBottom+20+$_l_ButtonHeight+10))
			GET WINDOW RECT:C443($_l_WIndowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WIndowBottom)
			$_l_ButtonRight:=($_l_WindowRight-$_l_WIndowLeft)-10
			$_l_ButtonBottom:=($_l_WIndowBottom-$_l_WindowTop)-10
			OBJECT SET COORDINATES:C1248(*; "oButtonSave"; $_l_ButtonRight-$_l_ButtonWidth; $_l_ButtonBottom-$_l_ButtonHeight; $_l_ButtonRight; $_l_ButtonBottom)
			$_l_ButtonRight:=$_l_ButtonRight-$_l_ButtonWidth-5
			OBJECT SET COORDINATES:C1248(*; "oButtonCancel"; $_l_ButtonRight-$_l_ButtonWidth; $_l_ButtonBottom-$_l_ButtonHeight; $_l_ButtonRight; $_l_ButtonBottom)
			OBJECT SET VISIBLE:C603(*; "oLabelText"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oVariableText"; False:C215)
			
			
			
		Else 
			CANCEL:C270
		End if 
End case 
ERR_MethodTrackerReturn("FM PREFERENCE_SETOBJECTS"; $_t_oldMethodName)
