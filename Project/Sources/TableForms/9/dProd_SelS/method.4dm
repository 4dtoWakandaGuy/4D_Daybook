If (False:C215)
	//Table Form Method Name: [PRODUCTS]dProd_SelS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad; WS_bo_InsearchScreen)
	C_DATE:C307($_d_EntryDateFrom; $_d_EntryDateTo; ACC_d_EntryDateFrom; SRCH_d_EntryDateTo)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_ch1; $_l_ch2; $_l_Context; $_l_cSetAdd; $_l_cSetMod; $_l_defaultparams; $_l_event; $_l_NAA; $_l_NAL; $_l_OK)
	C_LONGINT:C283($_l_SIS; ch1; ch2; cNAA; cNAL; cSetAdd; cSetMod; cSIS; rHold)
	C_REAL:C285($_r_AmountFrom; $_r_AmountTo; $_r_ValueF; $_r_ValueT; VAmountF; VAmountT; vValueF; vValueT)
	C_TEXT:C284($_t_Comments; $_t_LetterCode; $_t_oldMethodName; $_t_ProductCode; $_t_ProductName; $_t_Supplier; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; VComments; VLetterCode)
	C_TEXT:C284(VProdCode; vProdName; vProduct; Vsupplier)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [PRODUCTS].dProd_SelS"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[PRODUCTS:9]); "dProd_SelS")
		SM_LoadSearchParameterNames(Table:C252(->[PRODUCTS:9]); 2)
		
		rHold:=0
		
		Sel_LProc
		WS_AutoscreenSize(2; 322; 528)
		Case of 
			: (DB_t_CurrentFormUsage="Price")
				ch1:=1
			: (DB_t_CurrentFormUsage="Stock")
				ch2:=1
		End case 
		
		OBJECT SET TITLE:C194(ch2; Term_StoWT("Maintain Stock"))
		
		$_l_Context:=(Table:C252(->[PRODUCTS:9])*255)+1
		$_l_defaultparams:=Sm_SetUserSearchPrefs(False:C215; $_l_Context; <>PER_l_CurrentUserID)
		If ($_l_defaultparams>0)
			SM_LoadSearchParameters($_l_defaultparams)
			
		End if 
	: ($_l_event=On Menu Selected:K2:14)
		If (Menu selected:C152#0)
			If (Get menu title:C430(Menu selected:C152\65536)#"EDIT")
				$_t_ProductCode:=VProdCode
				$_t_ProductName:=vProdName
				$_t_Comments:=VComments
				$_t_ProductName:=vProduct
				$_r_AmountFrom:=VAmountF
				$_r_AmountTo:=VAmountT
				$_r_ValueF:=vValueF
				$_r_ValueT:=vValueT
				$_d_EntryDateFrom:=ACC_d_EntryDateFrom
				$_d_EntryDateTo:=SRCH_d_EntryDateTo
				$_t_Supplier:=Vsupplier
				$_t_LetterCode:=VLetterCode
				$_l_ch1:=CH1
				$_l_ch2:=CH2
				$_l_SIS:=cSIS
				$_l_NAA:=cNAA
				$_l_NAL:=cNAL
				$_l_cSetAdd:=cSetAdd
				$_l_cSetMod:=cSetMod
				$_l_OK:=Prod_SelLP
				VProdCode:=$_t_ProductCode
				VProdName:=$_t_ProductName
				VComments:=$_t_Comments
				VProduct:=$_t_ProductName
				VAmountF:=$_r_AmountFrom
				VAmountT:=$_r_AmountTo
				VValueF:=$_r_ValueF
				VvalueT:=$_r_ValueT
				ACC_d_EntryDateFrom:=$_d_EntryDateFrom
				SRCH_d_EntryDateTo:=$_d_EntryDateTo
				VSupplier:=$_t_Supplier
				VLetterCOde:=$_t_LetterCode
				CH1:=$_l_ch1
				CH2:=$_l_ch2
				cSIS:=$_l_SIS
				cNAA:=$_l_NAA
				cNAL:=$_l_NAL
				cSetAdd:=$_l_cSetAdd
				cSetMod:=$_l_cSetMod
				If ($_l_OK>0) & (Not:C34(rHold=1))
					ACCEPT:C269
					WS_bo_InsearchScreen:=False:C215
				End if 
			End if 
		End if 
	: ($_l_event=On Deactivate:K2:10)
		// PAUSE PROCESS(Current process)
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[PRODUCTS:9])
End case 
ERR_MethodTrackerReturn("FM [PRODUCTS].dProd_SelS"; $_t_oldMethodName)
