//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_ScrRepPrEx
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($2)
	//C_UNKNOWN(a01Real1)
	//C_UNKNOWN(a01Real2)
	//C_UNKNOWN(a01Real3)
	//C_UNKNOWN(a01Real4)
	//C_UNKNOWN(a01Real5)
	//C_UNKNOWN(a01Real6)
	//C_UNKNOWN(a01Stri1)
	//C_UNKNOWN(a01Stri2)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	C_BOOLEAN:C305($_bo_Continue)
	C_DATE:C307(<>DB_d_CurrentDate; $_D_amount)
	C_LONGINT:C283($_l_DataType; $_l_Index; $_l_OK; $_l_Page; $_l_PageCount; $_l_Rows; vNo)
	C_POINTER:C301($_Ptr_ThisHeaderVariable)
	C_REAL:C285($_r_amount; vAmount; vDue; vInvoiced; vPaid; vSubtotal; vT1; vT2; vT3; vT4; vT5)
	C_REAL:C285(vT6; vVAT)
	C_TEXT:C284($_t_ColumnTitle; $_t_DisplayFormat; $_t_EndofField; $_t_EndofRecord; $_t_oldMethodName; $_t_OutputString; $1; vCompCode; vCompName; vPPage; vtitle)
	C_TEXT:C284(vTitle1; vTitle2; vTitle3; vTitle4; vTitle5; vTitle6; vTitle7; vTitle8)
	C_TIME:C306($_ti_amount)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_ScrRepPrEx")

If ($1="Pr")
	//Gen_Confirm ("Please choose 100% Landscape Print Settings")
	$_l_OK:=PRINT_SetSIZE("A4"; "L"; vtitle)
	$_bo_Continue:=($_l_OK>=0)
Else 
	Gen_Confirm("Please name the Export file")
	$_bo_Continue:=(OK=1)
End if 
If (OK=1) & ($_bo_Continue)
	If ($1="Pr")
		
		// PRINT_SetSIZE ("A4";"L")
		// PAGE SETUP([INVOICES];"ScrRep_Hdr")
		//   PRINT SETTINGS
	Else 
		SET CHANNEL:C77(12; "")
		$_t_EndofRecord:=Char:C90(13)
		$_t_EndofField:=Char:C90(9)
	End if 
	If (OK=1)
		$_l_Rows:=Size of array:C274(a01Stri1)
		$_l_PageCount:=1
		$_l_Page:=1
		ARRAY TEXT:C222($_at_ColumnNames; 0)
		ARRAY TEXT:C222($_at_HeaderNames; 0)
		ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
		ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
		ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
		ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
		LISTBOX GET ARRAYS:C832(*; $2; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
		
		For ($_l_Index; 1; $_l_Rows)
			If (($_l_PageCount>26) & ($1="Pr"))
				PAGE BREAK:C6
				$_l_PageCount:=1
			End if 
			If ($_l_PageCount=1)
				If ($1="Pr")
					vPPage:="Page "+String:C10($_l_Page)
					Print form:C5([INVOICES:39]; "ScrRep_Hdr")
					$_l_Page:=$_l_Page+1
				Else 
					SEND PACKET:C103(vTitle+" "+String:C10(<>DB_d_CurrentDate)+$_t_EndofRecord+$_t_EndofRecord)
					For ($_l_Index; 1; Size of array:C274($_at_ColumnNames))
						$_Ptr_ThisHeaderVariable:=$_aptr_HeaderVariables{$_l_Index}
						$_t_ColumnTitle:=OBJECT Get title:C1068($_Ptr_ThisHeaderVariable->)
						SEND PACKET:C103($_t_ColumnTitle+$_t_EndofField)
					End for 
					SEND PACKET:C103($_t_EndofRecord)
					//+vTitle2+$_t_EndofField+vTitle3+$_t_EndofField+vTitle4+$_t_EndofField+vTitle5+$_t_EndofField+vTitle6+$_t_EndofField+vTitle7+$_t_EndofField+vTitle8+$_t_EndofRecord+$_t_EndofRecord)
				End if 
			End if 
			
			
			vCompCode:=a01Stri1{$_l_Index}
			vCompName:=a01Stri2{$_l_Index}
			vAmount:=a01Real1{$_l_Index}
			vPaid:=a01Real2{$_l_Index}
			vInvoiced:=a01Real3{$_l_Index}
			vDue:=a01Real4{$_l_Index}
			vSubtotal:=a01Real5{$_l_Index}
			vVAT:=a01Real6{$_l_Index}
			If ($1="Pr")
				Print form:C5([INVOICES:39]; "ScrRep_Det")
			Else 
				For ($_l_Index; 1; Size of array:C274($_at_ColumnNames))
					
					//RESOLVE POINTER($_aptr_ColumnVariables{$_l_Index}; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
					$_l_DataType:=Type:C295($_aptr_ColumnVariables{$_l_Index}->)
					$_t_DisplayFormat:=""
					//LB_SetFormat ($_ptr_ListboxArea;1;"";$_l_Index;$_l_Index;3)
					Case of 
						: ((Is real:K8:4=1) | ($_l_DataType=Real array:K8:17)) & ($_t_DisplayFormat="")
							
							$_t_DisplayFormat:="|AccountsNZ"
							$_r_amount:=$_aptr_ColumnVariables{$_l_Index}->
							$_t_OutputString:=String:C10($_r_amount; $_t_DisplayFormat)
							
						: (($_l_DataType=Is integer:K8:5) | ($_l_DataType=Integer array:K8:18)) & ($_t_DisplayFormat="")
							$_t_DisplayFormat:="|integers"
							$_r_amount:=$_aptr_ColumnVariables{$_l_Index}->
							$_t_OutputString:=String:C10($_r_amount; $_t_DisplayFormat)
							
						: (($_l_DataType=Is longint:K8:6) | ($_l_DataType=LongInt array:K8:19)) & ($_t_DisplayFormat="")
							$_t_DisplayFormat:="|Longint"
							$_r_amount:=$_aptr_ColumnVariables{$_l_Index}->
							$_t_OutputString:=String:C10($_r_amount; $_t_DisplayFormat)
							
						: (($_l_DataType=Is time:K8:8) | ($_l_DataType=Time array:K8:29)) & ($_t_DisplayFormat="")  // 26/06/06
							$_t_DisplayFormat:="&/5"
							$_ti_amount:=$_aptr_ColumnVariables{$_l_Index}->
							$_t_OutputString:=String:C10($_ti_amount; $_t_DisplayFormat)
							
						: ((Is date:K8:7=4) | ($_l_DataType=Date array:K8:20)) & ($_t_DisplayFormat="")
							$_t_DisplayFormat:=""
							$_D_amount:=$_aptr_ColumnVariables{$_l_Index}->
							
							$_t_OutputString:=String:C10($_D_amount; $_t_DisplayFormat)
							
						Else 
							$_t_DisplayFormat:=""
							$_t_OutputString:=String:C10($_aptr_ColumnVariables{$_l_Index}->; $_t_DisplayFormat)
							
					End case 
					//$_r_amount:=$_aptr_ColumnVariables{$_l_Index}->
					//SEND PACKET(vCompCode+$_t_EndofField+vCompName+$_t_EndofField+String(vAmount; "|Accounts")+$_t_EndofField+String(vPaid; "|Accounts")+$_t_EndofField+String(vInvoiced; "|Accounts")+$_t_EndofField+String(vDue; "|Accounts")+$_t_EndofField+String(vSubtotal; "|Accounts")+$_t_EndofField+String(vVAT; "|Accounts")+$_t_EndofRecord)
					//End if 
				End for 
				SEND PACKET:C103($_t_EndofRecord)
				
			End if 
			$_l_PageCount:=$_l_PageCount+1
		End for 
		
		If ($1="Pr")
			Print form:C5([INVOICES:39]; "ScrRep_Ftr")
			PAGE BREAK:C6
			PRT_SetPrinterPaperOptions(vtitle)
		Else 
			For ($_l_Index; 1; Size of array:C274($_at_ColumnNames))
				
				//RESOLVE POINTER($_aptr_ColumnVariables{$_l_Index}; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
				$_l_DataType:=Type:C295($_aptr_ColumnVariables{$_l_Index}->)
				$_t_DisplayFormat:=""
				//LB_SetFormat ($_ptr_ListboxArea;1;"";$_l_Index;$_l_Index;3)
				Case of 
					: ((Is real:K8:4=1) | ($_l_DataType=Real array:K8:17)) & ($_t_DisplayFormat="")
						
						$_t_DisplayFormat:="|AccountsNZ"
						$_r_amount:=$_aptr_ColumnVariables{$_l_Index}->
						$_t_OutputString:=String:C10($_r_amount; $_t_DisplayFormat)
						
					: (($_l_DataType=Is integer:K8:5) | ($_l_DataType=Integer array:K8:18)) & ($_t_DisplayFormat="")
						$_t_DisplayFormat:="|integers"
						$_r_amount:=$_aptr_ColumnVariables{$_l_Index}->
						$_t_OutputString:=String:C10($_r_amount; $_t_DisplayFormat)
						
					: (($_l_DataType=Is longint:K8:6) | ($_l_DataType=LongInt array:K8:19)) & ($_t_DisplayFormat="")
						$_t_DisplayFormat:="|Longint"
						$_r_amount:=$_aptr_ColumnVariables{$_l_Index}->
						$_t_OutputString:=String:C10($_r_amount; $_t_DisplayFormat)
						
					: (($_l_DataType=Is time:K8:8) | ($_l_DataType=Time array:K8:29)) & ($_t_DisplayFormat="")  // 26/06/06
						$_t_DisplayFormat:="&/5"
						$_ti_amount:=$_aptr_ColumnVariables{$_l_Index}->
						$_t_OutputString:=String:C10($_ti_amount; $_t_DisplayFormat)
						
					: ((Is date:K8:7=4) | ($_l_DataType=Date array:K8:20)) & ($_t_DisplayFormat="")
						$_t_DisplayFormat:=""
						$_D_amount:=$_aptr_ColumnVariables{$_l_Index}->
						
						$_t_OutputString:=String:C10($_D_amount; $_t_DisplayFormat)
						
					Else 
						$_t_DisplayFormat:=""
						$_t_OutputString:=String:C10($_aptr_ColumnVariables{$_l_Index}->; $_t_DisplayFormat)
						
				End case 
				//$_r_amount:=$_aptr_ColumnVariables{$_l_Index}->
				//SEND PACKET(vCompCode+$_t_EndofField+vCompName+$_t_EndofField+String(vAmount; "|Accounts")+$_t_EndofField+String(vPaid; "|Accounts")+$_t_EndofField+String(vInvoiced; "|Accounts")+$_t_EndofField+String(vDue; "|Accounts")+$_t_EndofField+String(vSubtotal; "|Accounts")+$_t_EndofField+String(vVAT; "|Accounts")+$_t_EndofRecord)
				//End if 
			End for 
			
			
			SEND PACKET:C103($_t_EndofRecord+String:C10(vNo)+$_t_EndofField+$_t_EndofField+String:C10(vT1; "|Accounts")+$_t_EndofField+String:C10(vT2; "|Accounts")+$_t_EndofField+String:C10(vT3; "|Accounts")+$_t_EndofField+String:C10(vT4; "|Accounts")+$_t_EndofField+String:C10(vT5; "|Accounts")+$_t_EndofField+String:C10(vT6; "|Accounts")+$_t_EndofRecord)
			SET CHANNEL:C77(11)
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("Gen_ScrRepPrEx"; $_t_oldMethodName)
