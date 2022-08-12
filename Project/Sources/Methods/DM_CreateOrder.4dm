//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_CreateOrder
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SalesHdrDP; vFromIn)
	C_LONGINT:C283($_l_DateType; $_l_Index; $_l_Index2; $_l_KeyFieldPosition; $_l_RecordCount; $2; DM_l_ValidityCheck; vAdd)
	C_POINTER:C301($_ptr_DataArray; $_Ptr_DataFieldsArray; $_Ptr_DataSourceArray; $_Ptr_DataStringsArray; $_ptr_Field; $_ptr_HeaderFieldsArray; $5)
	C_REAL:C285($1; vTot)
	C_TEXT:C284(<>Source; $_t_DetailString; $_t_HeaderString; $_t_oldMethodName; $3; $4; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; SD_t_CallingCompanyCode; SD_t_CallingContactCode)
	C_TEXT:C284(SYS_t_AccessType)
	C_TIME:C306($_ti_Time)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("DM_CreateOrder")
//THIS METHOD SIMULATES ORDER ENTRY
//BEHAVING IN A SIMILAR WAY TO AN ORDER ENTRY SCREEN
If (Count parameters:C259>=2)
	If ($1=DM_l_ValidityCheck) & (DM_l_ValidityCheck>0)
		//VALID CALL
		$_t_HeaderString:=$3
		$_t_DetailString:=$4
		$_ptr_HeaderFieldsArray:=Get pointer:C304("ORD_al_"+$3+"_Fields")
		StartTransaction
		States_Load2(24)
		Start_Process
		vAdd:=1
		SYS_t_AccessType:=""
		SalesHdrDP:=False:C215
		
		SalesHdrDP:=$2 ?? 1
		
		REDUCE SELECTION:C351([ORDERS:24]; 0)
		REDUCE SELECTION:C351([ORDER_ITEMS:25]; 0)
		DB_t_CurrentFormUsage:="None"
		vFromIn:=False:C215
		$_l_KeyFieldPosition:=Find in array:C230($_ptr_HeaderFieldsArray->; Field:C253(->[ORDERS:24]Company_Code:1))
		If ($_l_KeyFieldPosition>0)
			$_Ptr_DataSourceArray:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
			SD_t_CallingCompanyCode:=$_Ptr_DataSourceArray->{$_l_KeyFieldPosition}
		End if 
		$_l_KeyFieldPosition:=Find in array:C230($_ptr_HeaderFieldsArray->; Field:C253(->[ORDERS:24]Contact_Code:2))
		If ($_l_KeyFieldPosition>0)
			$_Ptr_DataSourceArray:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
			SD_t_CallingContactCode:=$_Ptr_DataSourceArray->{$_l_KeyFieldPosition}
		End if 
		<>Source:=""
		READ WRITE:C146([ORDERS:24])
		CREATE RECORD:C68([ORDERS:24])
		$_l_KeyFieldPosition:=Find in array:C230($_ptr_HeaderFieldsArray->; Field:C253(->[ORDERS:24]Order_Code:3))
		If ($_l_KeyFieldPosition>0)
			$_Ptr_DataSourceArray:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
			[ORDERS:24]Order_Code:3:=$_Ptr_DataSourceArray->{$_l_KeyFieldPosition}
		End if 
		//here we are emulating the order creation process
		Orders_InLPB
		//the form method calls Orders_InLPß ("B") this creates the area list area so it n
		//here populate the header fields received in the following way
		For ($_l_Index; 1; Size of array:C274($_ptr_HeaderFieldsArray->))
			$_ptr_Field:=Field:C253(Table:C252(->[ORDERS:24]); $_ptr_HeaderFieldsArray->{$_l_Index})
			$_l_DateType:=Type:C295($_ptr_Field->)
			Case of 
				: ($_l_DateType=Is alpha field:K8:1)
					$_ptr_DataArray:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
				: ($_l_DateType=Is text:K8:3)
					$_ptr_DataArray:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Text")
				: ($_l_DateType=Is real:K8:4)
					$_ptr_DataArray:=Get pointer:C304("ORD_ar_"+$_t_HeaderString+"_Real")
				: ($_l_DateType=Is longint:K8:6)
					$_ptr_DataArray:=Get pointer:C304("ORD_al_"+$_t_HeaderString+"_Longint")
				: ($_l_DateType=Is integer:K8:5)
					$_ptr_DataArray:=Get pointer:C304("ORD_ai_"+$_t_HeaderString+"_Integer")
				: ($_l_DateType=Is date:K8:7)
					$_ptr_DataArray:=Get pointer:C304("ORD_ad_"+$_t_HeaderString+"_Date")
				: ($_l_DateType=Is time:K8:8)
					$_ptr_DataArray:=Get pointer:C304("ORD_ati_"+$_t_HeaderString+"_Time")
				: ($_l_DateType=Is boolean:K8:9)
					$_ptr_DataArray:=Get pointer:C304("ORD_aBo_"+$_t_HeaderString+"_Boolean")
			End case 
			If ($_l_DateType=Is time:K8:8)
				$_ti_Time:=Time:C179(Time string:C180($_ptr_DataArray->{$_l_Index}))
				$_ptr_Field->:=$_ti_Time
			Else 
				$_ptr_Field->:=$_ptr_DataArray->{$_l_Index}
			End if 
			vTot:=0
			Orders_InLPD
		End for 
		DB_SaveRecord(->[ORDERS:24])
		AA_CheckFileUnlocked(->[ORDERS:24]x_ID:58)
		$_Ptr_DataFieldsArray:=Get pointer:C304("ORD_al_"+$_t_DetailString+"_Fields")
		$_Ptr_DataStringsArray:=Get pointer:C304("ORD_at_"+$_t_DetailString+"_Strings")
		$_l_RecordCount:=Size of array:C274($_Ptr_DataStringsArray->)
		//the order is now saved
		For ($_l_Index; 1; $_l_RecordCount)
			CREATE RECORD:C68([ORDER_ITEMS:25])
			OrderI_InLPB
			OrderI_SubLPB
			[ORDER_ITEMS:25]Order_Code:1:=[ORDERS:24]Order_Code:3
			For ($_l_Index2; 1; Size of array:C274($_Ptr_DataFieldsArray->))
				$_ptr_Field:=Field:C253(Table:C252(->[ORDER_ITEMS:25]); $_Ptr_DataFieldsArray->{$_l_Index2})
				$_l_DateType:=Type:C295($_ptr_Field->)
				Case of 
					: ($_l_DateType=Is alpha field:K8:1)
						$_ptr_DataArray:=Get pointer:C304("ORD_at_"+$_t_DetailString+"_Strings")
					: ($_l_DateType=Is text:K8:3)
						$_ptr_DataArray:=Get pointer:C304("ORD_at_"+$_t_DetailString+"_Text")
					: ($_l_DateType=Is real:K8:4)
						$_ptr_DataArray:=Get pointer:C304("ORD_ar_"+$_t_DetailString+"_Real")
					: ($_l_DateType=Is longint:K8:6)
						$_ptr_DataArray:=Get pointer:C304("ORD_al_"+$_t_DetailString+"_Longint")
					: ($_l_DateType=Is integer:K8:5)
						$_ptr_DataArray:=Get pointer:C304("ORD_ai_"+$_t_DetailString+"_Integer")
					: ($_l_DateType=Is date:K8:7)
						$_ptr_DataArray:=Get pointer:C304("ORD_ad_"+$_t_DetailString+"_Date")
					: ($_l_DateType=Is time:K8:8)
						$_ptr_DataArray:=Get pointer:C304("ORD_ati_"+$_t_DetailString+"_Time")
					: ($_l_DateType=Is boolean:K8:9)
						$_ptr_DataArray:=Get pointer:C304("ORD_aBo_"+$_t_DetailString+"_Boolean")
				End case 
				If ($_l_DateType=Is time:K8:8)
					$_ti_Time:=Time:C179(Time string:C180($_ptr_DataArray->{$_l_Index}{$_l_Index2}))
					$_ptr_Field->:=$_ti_Time
				Else 
					$_ptr_Field->:=$_ptr_DataArray->{$_l_Index}{$_l_Index2}
				End if 
				OrderI_SubLP
			End for 
			DB_SaveRecord(->[ORDER_ITEMS:25])
			AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
			
			
		End for 
		//and an LPA method for the order to go here
		Orders_InLPTot
		DM_SetOrderState($5)
		DB_SaveRecord(->[ORDERS:24])
		AA_CheckFileUnlocked(->[ORDERS:24]x_ID:58)
		//there is an lpa method to go here?
		Orders_InLPA
		
		Transact_End
	End if   //invalid call
	
End if   //invalid parameters
ERR_MethodTrackerReturn("DM_CreateOrder"; $_t_oldMethodName)