//%attributes = {}
If (False:C215)
	//Project Method Name:      StatsView_ArFiS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/11/2010 14:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SV_al_TableNumber;0)
	//ARRAY TEXT(DB_at_TableName;0)
	//ARRAY TEXT(SV_at_TableFindCodes;0)
	C_BOOLEAN:C305($_bo_Access)
	C_LONGINT:C283(<>Mod_l_MaxModules; $_l_Index; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_TableCode; $_t_TableName; $1; vT)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView_ArFiS")
//StatsView_ArFiS
StatsView_ArFi(0)
If (<>Mod_l_MaxModules=0)
	GET PROCESS VARIABLE:C371(-1; <>Mod_l_MaxModules; <>Mod_l_MaxModules)
End if 

$_l_Index:=0
vT:=$1
While (vT#"")
	IDLE:C311  // 7/04/03 pb
	$_t_TableName:=Uppercase:C13(First_Field(->vT; "/"))
	If ($_t_TableName#"")
		$_l_TableNumber:=Num:C11(First_Field(->vT; "/"))
		$_t_TableCode:=First_Field(->vT; "/")
		$_bo_Access:=False:C215
		If ($_l_Index>1)
			Case of 
				: (($_l_TableNumber=1) | ($_l_TableNumber=2))
					$_bo_Access:=((DB_GetModuleSettingByNUM(Module_Products))<2)
				: ($_l_TableNumber=12)
					$_bo_Access:=((DB_GetModuleSettingByNUM(Module_DiaryManager))<2)
				: (($_l_TableNumber=20) | ($_l_TableNumber=17))
					$_bo_Access:=((DB_GetModuleSettingByNUM(Module_ServiceCentre))<2)
					
				: ($_l_TableNumber=24)
					$_bo_Access:=(((DB_GetModuleSettingByNUM(Module_SalesOrders))<2) & ((DB_GetModuleSettingByNUM(Module_Enquiries))<2))
				: ($_l_TableNumber=25)
					$_bo_Access:=(((DB_GetModuleSettingByNUM(Module_SalesOrders))<2) & ((DB_GetModuleSettingByNUM(Module_JobCosting))<2))
					
				: (($_l_TableNumber=26) | ($_l_TableNumber=48) | ($_l_TableNumber=47) | ($_l_TableNumber=89))
					$_bo_Access:=((DB_GetModuleSettingByNUM(Module_JobCosting))<2)
				: (($_l_TableNumber=27) | ($_l_TableNumber=58) | ($_l_TableNumber=62) | ($_l_TableNumber=40))
					$_bo_Access:=((DB_GetModuleSettingByNUM(Module_StockControl))<2)
				: ($_l_TableNumber=29)
					$_bo_Access:=((DB_GetModuleSettingByNUM(Module_NominalLedger))<2)
				: ($_l_TableNumber=37)
					$_bo_Access:=((DB_GetModuleSettingByNUM(Module_PurchaseLedger))<2)
				: ($_l_TableNumber=39)
					$_bo_Access:=((DB_GetModuleSettingByNUM(Module_SalesLedger))<2)
				: ($_l_TableNumber=55)
					$_bo_Access:=(((DB_GetModuleSettingByNUM(14))<2))
					
					
				: ($_l_TableNumber=57)
					$_bo_Access:=((DB_GetModuleSettingByNUM(Module_PurchaseOrders))<2)
				: ($_l_TableNumber=67)
					$_bo_Access:=False:C215  // (◊aMod{23}<2)
			End case 
		End if 
		If ($_bo_Access=False:C215)
			$_l_Index:=$_l_Index+1
			INSERT IN ARRAY:C227(DB_at_TableName; $_l_Index; 1)
			INSERT IN ARRAY:C227(SV_al_TableNumber; $_l_Index; 1)
			INSERT IN ARRAY:C227(SV_at_TableFindCodes; $_l_Index; 1)
			DB_at_TableName{$_l_Index}:=$_t_TableName
			SV_al_TableNumber{$_l_Index}:=$_l_TableNumber
			SV_at_TableFindCodes{$_l_Index}:=$_t_TableCode
		End if 
	End if 
End while 
ERR_MethodTrackerReturn("StatsView_ArFiS"; $_t_oldMethodName)
