//%attributes = {}
If (False:C215)
	//Project Method Name:      Time_Product
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 16:46
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PER_abo_AdHocBudget;0)
	//ARRAY REAL(GEN_ar_Value;0)
	//ARRAY REAL(SRAmount;0)
	//ARRAY REAL(SRRate;0)
	//ARRAY TEXT(aPrevTypeC;0)
	//ARRAY TEXT(SVS_at_PreviewNote;0)
	C_DATE:C307(<>DB_d_CurrentDate; <>TimeYear; vDateF; vDateT)
	C_LONGINT:C283($_l_ArrayRow; $_l_ArraySize; $_l_CountRecords; i; vItemNum; vNo)
	C_REAL:C285($_l_YearCompleted; vAmount; vPrice; vT1; vT2; vT3; vT4; vT5; vT6; vValueT)
	C_TEXT:C284($_t_CatagoryCode; $_t_DateFromString; $_t_DateString; $_t_oldMethodName; vCharge; vFld; vRec)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Time_Product")
//Time_Product
//T1=vTotCBud  T2=vTotCWk  T3=vTotCYTD
//T4=vTotVBud   T5=vTotVWk   T6=vTotVYTD
//vItemNum=vWeekNo  arr vTotBud=GEN_ar_Value  vTotWk=SRRate  vTotYTD=SRAmount

Start_Process
//DEFAULT TABLE([TIME BUDGETS])
READ ONLY:C145
READ ONLY:C145([DIARY:12])
READ ONLY:C145([RESULTS:14])
READ ONLY:C145([PERSONNEL:11])
$_t_DateString:=String:C10(<>DB_d_CurrentDate+(7-(Day number:C114(<>DB_d_CurrentDate))-3))
vDateT:=Date:C102(Gen_Request("Report Date to (Week Ending):"; $_t_DateString))
If (OK=1)
	$_t_DateFromString:=String:C10(vDateT-6)
	vDateF:=Date:C102(Gen_Request("Date from:"; $_t_DateFromString))
	If (OK=1)
		
		vItemNum:=Week_No(vDateT)
		$_l_YearCompleted:=Round:C94((vItemNum/52*100); 2)
		ALL RECORDS:C47([TIME_BUDGETS:49])
		vNo:=Records in selection:C76([TIME_BUDGETS:49])
		
		Gen_Confirm("Please name and position the Report file on disk")
		If (OK=1)
			
			SET CHANNEL:C77(12; "")
			If (OK=1)
				vFld:=Char:C90(9)
				vRec:=Char:C90(13)
				
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Active:7=False:C215)
				CREATE SET:C116([PERSONNEL:11]; "Inactive")
				$_l_CountRecords:=Records in selection:C76([PERSONNEL:11])
				ARRAY TEXT:C222(SVS_at_PreviewNote; $_l_CountRecords)
				ARRAY TEXT:C222(aPrevTypeC; $_l_CountRecords)
				ARRAY REAL:C219(GEN_ar_Value; $_l_CountRecords)
				ARRAY BOOLEAN:C223(PER_abo_AdHocBudget; $_l_CountRecords)
				$_l_ArrayRow:=1
				FIRST RECORD:C50([PERSONNEL:11])
				While (Not:C34(End selection:C36([PERSONNEL:11])))
					SVS_at_PreviewNote{$_l_ArrayRow}:=[PERSONNEL:11]Initials:1
					aPrevTypeC{$_l_ArrayRow}:=[PERSONNEL:11]Category_Code:6
					GEN_ar_Value{$_l_ArrayRow}:=[PERSONNEL:11]Sales_Rate:5
					PER_abo_AdHocBudget{$_l_ArrayRow}:=[PERSONNEL:11]Adhoc_Budget:8
					$_l_ArrayRow:=$_l_ArrayRow+1
					NEXT RECORD:C51([PERSONNEL:11])
				End while 
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Active:7=True:C214)
				CREATE SET:C116([PERSONNEL:11]; "Active")
				ALL RECORDS:C47([TIME_BILLING_CATEGORIES:46])
				$_l_ArraySize:=Records in selection:C76([PERSONNEL:11])+(2*(Records in selection:C76([TIME_BILLING_CATEGORIES:46])))+3+2
				ARRAY REAL:C219(SRRate; $_l_ArraySize)
				ARRAY REAL:C219(SRAmount; $_l_ArraySize)
				ARRAY REAL:C219(GEN_ar_Value; $_l_ArraySize)
				
				//Header
				SEND PACKET:C103("Productivity Report: "+String:C10(vDateF)+"-"+String:C10(vDateT)+vFld+vFld+vFld+vFld+"Produced: "+String:C10(<>DB_d_CurrentDate)+vRec+vRec)
				SEND PACKET:C103("Week Ending: "+vFld+String:C10(vDateT)+vFld+"Week_No: "+vFld+String:C10(vItemNum)+vFld+"% Completed: "+vFld+String:C10($_l_YearCompleted)+vRec+vRec)
				SEND PACKET:C103(vFld+vFld+"BY INDIVIDUAL"+(vFld*(Records in selection:C76([PERSONNEL:11])+2+(2*(Records in selection:C76([TIME_BILLING_CATEGORIES:46])))))+vFld+vFld+"TOTAL COMPANY"+vRec)
				SEND PACKET:C103(vFld+vFld)
				
				ORDER BY:C49([PERSONNEL:11]; [PERSONNEL:11]Category_Code:6; >; [PERSONNEL:11]Initials:1; >)
				FIRST RECORD:C50([PERSONNEL:11])
				$_t_CatagoryCode:=[PERSONNEL:11]Category_Code:6
				While (Not:C34(End selection:C36([PERSONNEL:11])))
					SEND PACKET:C103([PERSONNEL:11]Initials:1+vFld)
					NEXT RECORD:C51([PERSONNEL:11])
					If ([PERSONNEL:11]Category_Code:6#$_t_CatagoryCode)
						SEND PACKET:C103("Inactive"+vFld+"Hrs Tot"+vFld+"£ Value"+vFld)
						$_t_CatagoryCode:=[PERSONNEL:11]Category_Code:6
					End if 
				End while 
				SEND PACKET:C103(vFld+"Hrs Tot"+vFld+"£ Value"+vRec+vRec)
				
				//Detail
				QUERY:C277([RESULTS:14]; [RESULTS:14]Time_Result:3=True:C214)
				ORDER BY:C49([RESULTS:14]; [RESULTS:14]Result_Code:1; >)
				While (Not:C34(End selection:C36([RESULTS:14])))
					SEND PACKET:C103([RESULTS:14]Result_Code:1+vFld+[RESULTS:14]Result_Name:2+vFld)
					
					vT2:=0
					vT3:=0
					vT1:=0
					vT5:=0
					vT6:=0
					vT4:=0
					
					//Week
					USE SET:C118("Active")
					ORDER BY:C49([PERSONNEL:11]Category_Code:6; >; [PERSONNEL:11]Initials:1; >)
					FIRST RECORD:C50([PERSONNEL:11])
					vCharge:=[PERSONNEL:11]Category_Code:6
					vAmount:=0
					vValueT:=0
					i:=1
					While (Not:C34(End selection:C36([PERSONNEL:11])))
						QUERY:C277([DIARY:12]; [DIARY:12]Person:8=[PERSONNEL:11]Initials:1; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]Result_Code:11=[RESULTS:14]Result_Code:1; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Done_From:5>=vDateF; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Done_From:5<=vDateT)
						vPrice:=Sum:C1([DIARY:12]Units:20)
						SEND PACKET:C103(String:C10(vPrice)+vFld)
						vAmount:=vAmount+vPrice
						vValueT:=vValueT+Sum:C1([DIARY:12]Value:16)
						SRRate{i}:=SRRate{i}+vPrice
						i:=i+1
						NEXT RECORD:C51([PERSONNEL:11])
						If ([PERSONNEL:11]Category_Code:6#vCharge)
							Time_ProdCatIn("Week")
							SEND PACKET:C103(String:C10(vAmount)+vFld+String:C10(vValueT)+vFld)
							SRRate{i}:=SRRate{i}+vAmount
							i:=i+1
							SRRate{i}:=SRRate{i}+vValueT
							i:=i+1
							vCharge:=[PERSONNEL:11]Category_Code:6
							vT2:=vT2+vAmount
							vT5:=vT5+vValueT
							vAmount:=0
							vValueT:=0
						End if 
					End while 
					SEND PACKET:C103(vFld+String:C10(vT2)+vFld+String:C10(vT5)+vRec)
					SRRate{i}:=SRRate{i}+vT2
					i:=i+1
					SRRate{i}:=SRRate{i}+vT5
					i:=i+1
					
					//YTD
					SEND PACKET:C103(vFld+"Total to Date"+vFld)
					USE SET:C118("Active")
					ORDER BY:C49([PERSONNEL:11]Category_Code:6; >; [PERSONNEL:11]Initials:1; >)
					FIRST RECORD:C50([PERSONNEL:11])
					vCharge:=[PERSONNEL:11]Category_Code:6
					vAmount:=0
					vValueT:=0
					i:=1
					While (Not:C34(End selection:C36([PERSONNEL:11])))
						QUERY:C277([DIARY:12]; [DIARY:12]Person:8=[PERSONNEL:11]Initials:1; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]Result_Code:11=[RESULTS:14]Result_Code:1; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Done_From:5>=<>TimeYear; *)
						QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Done_From:5<=vDateT)
						vPrice:=Sum:C1([DIARY:12]Units:20)
						SEND PACKET:C103(String:C10(vPrice)+vFld)
						vAmount:=vAmount+vPrice
						vValueT:=vValueT+Sum:C1([DIARY:12]Value:16)
						SRAmount{i}:=SRAmount{i}+vPrice
						i:=i+1
						NEXT RECORD:C51([PERSONNEL:11])
						If ([PERSONNEL:11]Category_Code:6#vCharge)
							Time_ProdCatIn("YTD")
							SEND PACKET:C103(String:C10(vAmount)+vFld+String:C10(vValueT)+vFld)
							SRAmount{i}:=SRAmount{i}+vAmount
							i:=i+1
							SRAmount{i}:=SRAmount{i}+vValueT
							i:=i+1
							vCharge:=[PERSONNEL:11]Category_Code:6
							vT3:=vT3+vAmount
							vT6:=vT6+vValueT
							vAmount:=0
							vValueT:=0
						End if 
					End while 
					SEND PACKET:C103(vFld+String:C10(vT3)+vFld+String:C10(vT6)+vRec)
					SRAmount{i}:=SRAmount{i}+vT3
					i:=i+1
					SRAmount{i}:=SRAmount{i}+vT6
					i:=i+1
					
					//Budget
					SEND PACKET:C103(vFld+"Budget"+vFld)
					USE SET:C118("Active")
					ORDER BY:C49([PERSONNEL:11]Category_Code:6; >; [PERSONNEL:11]Initials:1; >)
					FIRST RECORD:C50([PERSONNEL:11])
					vCharge:=[PERSONNEL:11]Category_Code:6
					vAmount:=0
					vValueT:=0
					i:=1
					While (Not:C34(End selection:C36([PERSONNEL:11])))
						QUERY:C277([TIME_BUDGETS:49]; [TIME_BUDGETS:49]Person:1=[PERSONNEL:11]Initials:1; *)
						QUERY:C277([TIME_BUDGETS:49];  & ; [TIME_BUDGETS:49]Result_Code:3=[RESULTS:14]Result_Code:1)
						Time_ProdBudC
						SEND PACKET:C103(String:C10(vPrice)+vFld)
						vAmount:=vAmount+vPrice
						vValueT:=vValueT+(vPrice*[PERSONNEL:11]Sales_Rate:5)
						GEN_ar_Value{i}:=GEN_ar_Value{i}+vPrice
						i:=i+1
						NEXT RECORD:C51([PERSONNEL:11])
						If ([PERSONNEL:11]Category_Code:6#vCharge)
							Time_ProdCatIn("Bud")
							SEND PACKET:C103(String:C10(vAmount)+vFld+String:C10(vValueT)+vFld)
							GEN_ar_Value{i}:=GEN_ar_Value{i}+vAmount
							i:=i+1
							GEN_ar_Value{i}:=GEN_ar_Value{i}+vValueT
							i:=i+1
							vCharge:=[PERSONNEL:11]Category_Code:6
							vT1:=vT1+vAmount
							vT4:=vT4+vValueT
							vAmount:=0
							vValueT:=0
						End if 
					End while 
					SEND PACKET:C103(vFld+String:C10(vT1)+vFld+String:C10(vT4)+vRec)
					GEN_ar_Value{i}:=GEN_ar_Value{i}+vT1
					i:=i+1
					GEN_ar_Value{i}:=GEN_ar_Value{i}+vT4
					i:=i+1
					SEND PACKET:C103(vRec)
					NEXT RECORD:C51([RESULTS:14])
				End while 
				
				//Total for week
				SEND PACKET:C103(vFld+"TOTAL FOR WEEK"+vFld)
				Time_ProdTot
				
			End if 
			SET CHANNEL:C77(11)
		End if 
	End if 
End if 
Process_End
ERR_MethodTrackerReturn("Time_Product"; $_t_oldMethodName)
