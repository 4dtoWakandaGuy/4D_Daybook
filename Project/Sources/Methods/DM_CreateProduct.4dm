//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_CreateProduct
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
	C_BOOLEAN:C305(vFromIn)
	C_LONGINT:C283($_l_DataType; $_l_Index; DM_l_ValidityCheck; vAdd)
	C_POINTER:C301($_ptr_DataArray; $_ptr_Field; $_ptr_HeaderFieldsArray; $5)
	C_REAL:C285($1; $2)
	C_TEXT:C284($_t_DetailString; $_t_HeaderString; $_t_oldMethodName; $3; $4; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; SYS_t_AccessType)
	C_TIME:C306($_ti_Time)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_CreateProduct")
If (Count parameters:C259>=2)
	If ($1=DM_l_ValidityCheck) & (DM_l_ValidityCheck>0)
		//VALID CALL
		$_t_HeaderString:=$3
		$_t_DetailString:=$4
		$_ptr_HeaderFieldsArray:=Get pointer:C304("PRD_l_a"+$3+"_Fields")
		
		StartTransaction
		Start_Process
		vAdd:=1
		SYS_t_AccessType:=""
		DB_t_CurrentFormUsage:="None"
		vFromIn:=False:C215
		REDUCE SELECTION:C351([PRODUCTS:9]; 0)
		READ WRITE:C146([PRODUCTS:9])
		CREATE RECORD:C68([PRODUCTS:9])
		
		Products_InLPB
		$_ptr_HeaderFieldsArray:=Get pointer:C304("ITM_al"+$_t_HeaderString+"_Fields")
		For ($_l_Index; 1; Size of array:C274($_ptr_HeaderFieldsArray->))
			$_ptr_Field:=Field:C253(Table:C252(->[PRODUCTS:9]); $_ptr_HeaderFieldsArray->{$_l_Index})
			$_l_DataType:=Type:C295($_ptr_Field->)
			Case of 
				: ($_l_DataType=Is alpha field:K8:1)
					$_ptr_DataArray:=Get pointer:C304("ITM_at"+$_t_HeaderString+"_Strings")
				: ($_l_DataType=Is text:K8:3)
					$_ptr_DataArray:=Get pointer:C304("ITM_at"+$_t_HeaderString+"_Text")
				: ($_l_DataType=Is real:K8:4)
					$_ptr_DataArray:=Get pointer:C304("ITM_ar"+$_t_HeaderString+"_Real")
				: ($_l_DataType=Is longint:K8:6)
					$_ptr_DataArray:=Get pointer:C304("ITM_al"+$_t_HeaderString+"_Longint")
				: ($_l_DataType=Is integer:K8:5)
					$_ptr_DataArray:=Get pointer:C304("ITM_ai"+$_t_HeaderString+"_Integer")
				: ($_l_DataType=Is date:K8:7)
					$_ptr_DataArray:=Get pointer:C304("ITM_ad"+$_t_HeaderString+"_Date")
				: ($_l_DataType=Is time:K8:8)
					$_ptr_DataArray:=Get pointer:C304("ITM_ati"+$_t_HeaderString+"_Time")
				: ($_l_DataType=Is boolean:K8:9)
					$_ptr_DataArray:=Get pointer:C304("ITM_abo"+$_t_HeaderString+"_Boolean")
					
			End case 
			If ($_l_DataType=Is time:K8:8) & (False:C215)
				
				$_ti_Time:=Time:C179(Time string:C180($_ptr_DataArray->{$_l_Index}))
				$_ptr_Field->:=$_ti_Time
			Else 
				$_ptr_Field->:=$_ptr_DataArray->{$_l_Index}
			End if 
			Products_InLPD
			If ([PRODUCTS:9]Product_Code:1="")
				[PRODUCTS:9]Product_Code:1:=String:C10(AA_GetNextID(->[PRODUCTS:9]Product_Code:1))
				
				
				
				
			End if 
			
			
		End for 
		DB_SaveRecord(->[PRODUCTS:9])
		$5->:=[PRODUCTS:9]Product_Code:1
		AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
		Transact_End
	End if 
End if 
ERR_MethodTrackerReturn("DM_CreateProduct"; $_t_oldMethodName)