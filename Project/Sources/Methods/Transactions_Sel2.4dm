//%attributes = {}
If (False:C215)
	//Project Method Name:      Transactions_Sel2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/02/2012 17:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SelOr)
	C_LONGINT:C283($_l_StringLength)
	C_TEXT:C284($_t_oldMethodName; $1; $_t_Search; $_t_SearchAt)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Transactions_Sel2")



$_t_Search:=$1+"@"
If (((Length:C16($_t_Search)=1) & (Character code:C91($_t_Search)=64)) | ($_t_Search=""))
	ALL RECORDS:C47([TRANSACTIONS:29])
Else 
	If ($_t_Search="Transaction Batch: @") | ($_t_Search="Batch: @")
		If ($_t_Search="Transaction Batch: @")
			$_t_Search:=Substring:C12($_t_Search; Length:C16("Transaction Batch: ")+1)
		Else 
			$_t_Search:=Substring:C12($_t_Search; Length:C16("Batch: ")+1)
		End if 
		QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=Num:C11($_t_Search))
		
		
	Else 
		If ($_t_Search="Event: @")
			$_t_Search:=Substring:C12($_t_Search; 8; 32000)
			QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Event_Code:26=$_t_Search)
			
		Else 
			If ($_t_Search="Company: @")
				$_t_Search:=Substring:C12($_t_Search; 10; 32000)
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Company_Code:9=$_t_Search)
			Else 
				
				If ($_t_Search="Invoice: @")
					$_t_Search:=Substring:C12($_t_Search; 8; 32000)
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Invoice_Number:4=$_t_Search)
				Else 
					If ($_t_Search="Purchase Invoice: @")
						$_l_StringLength:=Length:C16("Purchase Invoice: ")
						$_t_Search:=Substring:C12($_t_Search; $_l_StringLength+1)
						QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Purchase_invoice_number:19=$_t_Search)
					Else 
						If ($_t_Search="Purchase Code: @")
							$_l_StringLength:=Length:C16("Purchase Code: ")
							$_t_Search:=Substring:C12($_t_Search; $_l_StringLength+1)
							
							QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Purchase_Code:24=$_t_Search)
						Else 
							If ($_t_Search="Account Code: @")
								$_l_StringLength:=Length:C16("Account Code: ")
								$_t_Search:=Substring:C12($_t_Search; $_l_StringLength+1)
								QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=$_t_Search)
							Else 
								If ($_t_Search="Period Code: @")
									$_l_StringLength:=Length:C16("Period Code: ")
									$_t_Search:=Substring:C12($_t_Search; $_l_StringLength+1)
									QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Period_Code:12=$_t_Search)
								Else 
									If ($_t_Search="Analysis Code: @")
										$_l_StringLength:=Length:C16("Analysis Code: ")
										$_t_Search:=Substring:C12($_t_Search; $_l_StringLength+1)
										QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Analysis_Code:2=$_t_Search)
									Else 
										If ($_t_Search="Layer Code: @")
											$_l_StringLength:=Length:C16("Layer Code: ")
											$_t_Search:=Substring:C12($_t_Search; $_l_StringLength+1)
											QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Layer_Code:23=$_t_Search)
										Else 
											If ($_t_Search="Currency Code: @")
												$_l_StringLength:=Length:C16("Currency Code: ")
												$_t_Search:=Substring:C12($_t_Search; $_l_StringLength+1)
												QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22=$_t_Search)
												SelOr_1(->[TRANSACTIONS:29])
											Else 
												$_t_SearchAt:=Sel_AtSign($_t_Search)
												QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3=$_t_SearchAt)
												SelOr_1(->[TRANSACTIONS:29])
												If ((Records in selection:C76([TRANSACTIONS:29])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
													Sel_NoAtAt(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Account_Code:3; $1; $_t_SearchAt)
													SelOr_2(->[TRANSACTIONS:29])
												End if 
												If (((Records in selection:C76([TRANSACTIONS:29])=0) | ((<>SelOr) & (vAutoFind=False:C215))))
													Sel_NoAtAt(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Company_Code:9; $1; $_t_SearchAt)
													SelOr_2(->[TRANSACTIONS:29])
												End if 
												
												If ((Records in selection:C76([TRANSACTIONS:29])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
													If (Num:C11($_t_Search)>0)
														If (String:C10(Num:C11($_t_Search))=$_t_Search)
															QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=Num:C11($_t_Search))
															QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7#0)
														End if 
														SelOr_2(->[TRANSACTIONS:29])
													End if 
												End if 
												If ((Records in selection:C76([TRANSACTIONS:29])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
													QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_Type_Code:1=$_t_SearchAt)
													SelOr_2(->[TRANSACTIONS:29])
												End if 
												If ((Records in selection:C76([TRANSACTIONS:29])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
													If (Date:C102($_t_Search)#!00-00-00!)
														
														QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Trans_Date:5=Date:C102($_t_Search))
														SelOr_2(->[TRANSACTIONS:29])
													End if 
												End if 
												If ((Records in selection:C76([TRANSACTIONS:29])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
													QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Period_Code:12=$_t_SearchAt)
													SelOr_2(->[TRANSACTIONS:29])
												End if 
												If ((Records in selection:C76([TRANSACTIONS:29])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
													QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Purchase_Code:24=$_t_SearchAt)
													SelOr_2(->[TRANSACTIONS:29])
												End if 
												If ((Records in selection:C76([TRANSACTIONS:29])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
													QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Purchase_invoice_number:19=$_t_SearchAt)
													SelOr_2(->[TRANSACTIONS:29])
												End if 
												If ((Records in selection:C76([TRANSACTIONS:29])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
													QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Invoice_Number:4=$_t_SearchAt)
													SelOr_2(->[TRANSACTIONS:29])
												End if 
												If ((Records in selection:C76([TRANSACTIONS:29])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
													QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Event_Code:26=$_t_SearchAt)
													SelOr_2(->[TRANSACTIONS:29])
												End if 
												If ((Records in selection:C76([TRANSACTIONS:29])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
													QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Job_Code:25=$_t_SearchAt)
													SelOr_2(->[TRANSACTIONS:29])
												End if 
												If ((Records in selection:C76([TRANSACTIONS:29])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
													QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Currency_Code:22=$_t_SearchAt)
													SelOr_2(->[TRANSACTIONS:29])
												End if 
												If ((Records in selection:C76([TRANSACTIONS:29])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
													QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Analysis_Code:2=$_t_SearchAt)
													SelOr_2(->[TRANSACTIONS:29])
												End if 
												If ((Records in selection:C76([TRANSACTIONS:29])=0) | ((<>SelOr) & (vAutoFind=False:C215)))
													QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Layer_Code:23=$_t_SearchAt)
													SelOr_3(->[TRANSACTIONS:29])
												Else 
													SelOr_3(->[TRANSACTIONS:29])
												End if 
											End if 
											
											
										End if 
									End if 
									
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Transactions_Sel2"; $_t_oldMethodName)