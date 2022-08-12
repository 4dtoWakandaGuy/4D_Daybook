//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Move InType
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Move InType")
vType:=[MOVEMENT_TYPES:60]Type_Name:2
If (([MOVEMENT_TYPES:60]Stock_Plus:3#"") | ([MOVEMENT_TYPES:60]Stock_Minus:4#""))
	vType:=vType+"("
	If ([MOVEMENT_TYPES:60]Stock_Plus:3#"")
		vType:=vType+"+"+[MOVEMENT_TYPES:60]Stock_Plus:3+" "
	End if 
	If ([MOVEMENT_TYPES:60]Stock_Minus:4#"")
		vType:=vType+"-"+[MOVEMENT_TYPES:60]Stock_Minus:4+" "
	End if 
	vType:=vType+")"
End if 
If ([STOCK_MOVEMENTS:40]Movement_Type:6#"")
	If ([MOVEMENT_TYPES:60]Number_Mod:8=False:C215)
		OBJECT SET ENTERABLE:C238([STOCK_MOVEMENTS:40]Type_Number:4; False:C215)
	End if 
	//SET ENTERABLE([STOCK MOVEMENTS]Movement Type;False)
End if 
ERR_MethodTrackerReturn("Move InType"; $_t_oldMethodName)