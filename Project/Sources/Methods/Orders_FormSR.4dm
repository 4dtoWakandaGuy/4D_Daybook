//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_FormSR
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SRDesc;0)
	//ARRAY TEXT(SRProdCode;0)
	C_LONGINT:C283($_l_SizeofArray; $2)
	C_TEXT:C284($_t_Comments; $_t_ExecuteMethodName; $_t_oldMethodName; $1; vComments; vDesc)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Orders_FormSR")


vDesc:=""
If ($1#"")
	//$_t_oldMethodName2:=ERR_MethodTracker ("EXECUTE: "+$1)
	//EXECUTE FORMULA($1)
	$_t_ExecuteMethodName:=STR_RemoveLeadTrailSpace($1)
	EXECUTE METHOD:C1007($_t_ExecuteMethodName)
End if 
If (Not:C34(End selection:C36([ORDERS:24])))
	If ([ORDERS:24]Print_Comments:44=False:C215)
		vComments:=""
	Else 
		vComments:=[ORDERS:24]Comments:14
	End if 
	
	If ((DB_GetModuleSettingByNUM(Module_Assemblies))>0)
		COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "FormSRStart")  //Copy because it will be messed up by the Base bit
	End if 
	FIRST RECORD:C50([ORDER_ITEMS:25])
	CREATE EMPTY SET:C140([ORDER_ITEMS:25]; "Base")
	Form_SRArray(0)
	Orders_FormSR3(0; (Count parameters:C259=1))
	
	If ((Records in set:C195("Base")>0) & (Count parameters:C259=1))
		USE SET:C118("Base")
		FIRST RECORD:C50([ORDER_ITEMS:25])
		Form_SRArrIns(2)
		$_l_SizeofArray:=Size of array:C274(SRProdCode)
		SRDesc{$_l_SizeofArray}:="Components:"
		ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26; >)
		Orders_FormSR3(1; (Count parameters:C259=1))
	End if 
	CLEAR SET:C117("Base")
	If ((DB_GetModuleSettingByNUM(Module_Assemblies))>0)
		USE NAMED SELECTION:C332("FormSRStart")
		CLEAR NAMED SELECTION:C333("FormSRStart")
	End if 
	
	FIRST RECORD:C50([ORDER_ITEMS:25])
End if 
ERR_MethodTrackerReturn("Orders_FormSR"; $_t_oldMethodName)
