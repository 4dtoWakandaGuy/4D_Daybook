//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_CFCalcRel
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
	ARRAY REAL:C219($_ar_Num; 0)
	ARRAY TEXT:C222($_at_Codes; 0)
	C_BOOLEAN:C305($_bo_Coninue; $_bo_Coninue2)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_Count; $_l_Index; $_l_Index2; $i; $j; cEnvelopes; cLabels; cLetters; cMerged; cOC; cPreview)
	C_POINTER:C301($_ptr_Field; $1; $2; $3; $5)
	C_REAL:C285($_r_Average; $_r_Highest; $_r_Lowest; $_r_Number; $_r_Total; vT1; vT2; vT3; vT4; vT5; vT6)
	C_REAL:C285(vT7; vT8; vTot; vTot2)
	C_TEXT:C284($_t_oldMethodName; $_t_StatesCode; $4; vFld; vRec; vTitle10; vTitle11)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_CFCalcRel")

vFld:=Char:C90(9)
vRec:=Char:C90(13)
Sel_LinkMess($2)
If (OK=1)
	
	If (cOC=1)
		Gen_Confirm("Please name the Results file."; "OK"; "Cancel")
		If (OK=1)
			SET CHANNEL:C77(12; "")
			If (OK=1)
				SEND PACKET:C103("Cross-File Calculations"+vFld+vFld+String:C10(<>DB_d_CurrentDate; 1)+vRec+vRec)
				SEND PACKET:C103("Tables: "+Table name:C256($1)+" to "+Table name:C256($2)+vRec+vRec)
				SEND PACKET:C103(vTitle10+vRec+vRec)
				SEND PACKET:C103("Code"+vFld+"Count"+vFld)
				If (vTitle11#"")
					SEND PACKET:C103("Sum"+vFld+"Average"+vFld+"Highest"+vFld+"Lowest")
				End if 
				SEND PACKET:C103(vRec+vRec)
			Else 
				cOC:=0
			End if 
		Else 
			cOC:=0
		End if 
	End if 
	
	QUERY SELECTION:C341($2->; $3->#"")
	ORDER BY:C49($2->; $3->)
	CREATE EMPTY SET:C140($1->; "Master")
	If (vTitle11#"")
		$_ptr_Field:=Field:C253(Table:C252($2); Num:C11(vTitle11))
	End if 
	
	If (cEnvelopes#0)
		ARRAY TEXT:C222($_at_Codes; cLabels)
		ARRAY REAL:C219($_ar_Num; cLabels)
	End if 
	
	FIRST RECORD:C50($2->)
	While (Not:C34(End selection:C36($2->)))
		$_t_StatesCode:=$3->
		//   RELATE ONE($3»)
		QUERY:C277($1->; $5->=$3->)
		$_l_Count:=0
		$_r_Total:=0
		$_r_Highest:=0
		$_r_Lowest:=99999999
		While ((Not:C34(End selection:C36($2->))) & ($_t_StatesCode=$3->))
			If (vTitle11#"")
				If ($_ptr_Field->>$_r_Highest)
					$_r_Highest:=$_ptr_Field->
				End if 
				If ($_ptr_Field-><$_r_Lowest)
					$_r_Lowest:=$_ptr_Field->
				End if 
				$_r_Total:=$_r_Total+$_ptr_Field->
			End if 
			$_l_Count:=$_l_Count+1
			NEXT RECORD:C51($2->)
		End while 
		$_bo_Coninue2:=True:C214
		If ((vTot#0) | (vTot2#0))
			If (vTot2=0)
				vTot2:=999999999
			End if 
			$_bo_Coninue2:=(($_l_Count>=vTot) & ($_l_Count<=vTot2))
		End if 
		
		If ((vT1#0) | (vT2#0))
			If (vT2=0)
				vT2:=999999999
			End if 
			If ($_bo_Coninue2)
				$_bo_Coninue2:=(($_r_Total>=vT1) & ($_r_Total<=vT2))
			End if 
		End if 
		$_r_Average:=$_r_Total/$_l_Count
		If ((vT3#0) | (vT4#0))
			If (vT4=0)
				vT4:=999999999
			End if 
			If ($_bo_Coninue2)
				$_bo_Coninue2:=(($_r_Average>=vT3) & ($_r_Average<=vT4))
			End if 
		End if 
		If ((vT5#0) | (vT6#0))
			If (vT6=0)
				vT6:=999999999
			End if 
			If ($_bo_Coninue2)
				$_bo_Coninue2:=(($_r_Highest>=vT5) & ($_r_Highest<=vT6))
			End if 
		End if 
		If ((vT7#0) | (vT8#0))
			If (vT8=0)
				vT8:=999999999
			End if 
			If ($_bo_Coninue2)
				$_bo_Coninue2:=(($_r_Lowest>=vT7) & ($_r_Lowest<=vT8))
			End if 
		End if 
		If ($_bo_Coninue2)
			ADD TO SET:C119($1->; "Master")
			
			If (cEnvelopes#0)
				Case of 
					: (cEnvelopes=1)
						$_r_Number:=$_l_Count
					: (cEnvelopes=2)
						$_r_Number:=$_r_Total
					: (cEnvelopes=3)
						$_r_Number:=$_r_Average
				End case 
				
				//$i:=1
				$_bo_Coninue:=True:C214
				For ($_l_Index; 1; Clabels)
					
					//While (($i<=cLabels) & ($_bo_Coninue))
					//IDLE  // 7/04/03 pb
					If ((($_r_Number>$_ar_Num{$_l_Index}) & (cPreview=1)) | ((($_at_Codes{$_l_Index}="") | ($_r_Number<$_ar_Num{$_l_Index})) & (cLetters=1)))
						$_l_Index2:=cLabels
						For ($_l_Index2; clabels; $_l_Index; -1)
							//While (($j>=$i) & ($j>1))
							IDLE:C311  // 7/04/03 pb
							$_at_Codes{$_l_Index2}:=$_at_Codes{$_l_Index2-1}
							$_ar_Num{$_l_Index2}:=$_ar_Num{$_l_Index2-1}
							//$j:=$j-1
							//End while
						End for 
						$_at_Codes{$_l_Index}:=$_t_StatesCode
						$_ar_Num{$_l_Index}:=$_r_Number
						$_l_Index:=clabels  //:=False
					End if 
					
					//End while
				End for 
			End if 
			
		End if 
		If ((cOC=1) & (($_bo_Coninue2) | (cMerged=0)))
			SEND PACKET:C103($_t_StatesCode+vFld+String:C10($_l_Count)+vFld)
			If (vTitle11#"")
				SEND PACKET:C103(String:C10($_r_Total; "|Accounts")+vFld+String:C10($_r_Average; "|Accounts")+vFld+String:C10($_r_Highest; "|Accounts")+vFld+String:C10($_r_Lowest; "|Accounts"))
			End if 
			SEND PACKET:C103(vRec)
		End if 
	End while 
	
	If (cEnvelopes#0)
		CREATE EMPTY SET:C140($1->; "Extra")
		If (cOC=1)
			SEND PACKET:C103(vRec+vRec+("Top"*(Num:C11(cPreview=1)))+("Bottom"*(Num:C11(cLetters=1)))+" "+String:C10(cLabels)+vRec+vRec)
			SEND PACKET:C103("Code"+vFld+("Count"*(Num:C11(cEnvelopes=1)))+("Sum"*(Num:C11(cEnvelopes=2)))+("Average"*(Num:C11(cEnvelopes=3)))+vRec+vRec)
		End if 
		$_l_Index:=1
		QUERY WITH ARRAY:C644($5->; $_at_Codes)
		CREATE SET:C116($1->; "Extra2")
		UNION:C120("Extra"; "Extra2"; "Extra")
		CLEAR SET:C117("Extra2")
		If (cOC=1)
			For ($_l_Index; 1; cLabels)
				//While ($i<=cLabels)
				//.If($_at_Codes{$_l_Index}#"")  //
				//QUERY($1->;$5->=$_at_Codes{$_l_Index})
				//ADD TO SET($1->;"Extra")
				If (cOC=1)
					SEND PACKET:C103($_at_Codes{$_l_Index}+vFld+String:C10($_ar_Num{$_l_Index}; "|Accounts")+vRec)
				End if 
				//End if
				//$i:=$i+1
				//End while
			End for 
		End if 
		INTERSECTION:C121("Master"; "Extra"; "Master")
	End if 
	USE SET:C118("Master")
	
	If (cOC=1)
		SET CHANNEL:C77(11)
	End if 
	
Else 
	USE SET:C118($4)
	CREATE SET:C116($1->; "Master")
End if 
ERR_MethodTrackerReturn("Sel_CFCalcRel"; $_t_oldMethodName)
