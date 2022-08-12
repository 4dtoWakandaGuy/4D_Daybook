//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_Code
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/10/2010 07:50
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_indexed; $_bo_MultipleNos; $_bo_WindowOpen; ID_bo_GenCodeActivate)
	C_LONGINT:C283(<>GCUSED; $_l_Clash; $_l_Clashes; $_l_DIfference; $_l_FieldLength; $_l_FieldNumber; $_l_FieldType; $_l_GCIncrease; $_l_MPNumber; $_l_NewNumberProcess; $_l_NumClash)
	C_LONGINT:C283($_l_offset; $_l_OK; $_l_Process; $_l_ProcessState; $_l_ProcessTime; $_l_RecordsInSelectionMN; $_l_Repeats; $_l_Span; $_l_SpanOLD; $_l_TableNumber; $_l_testClashNum)
	C_LONGINT:C283($0; $1; $S; $Semaphoretrap; GenCodeProcess; ID_l_Parameter3; ID_l_Parameter4; ID_l_Parameter5; ID_l_ParameterCount; MPNUMBER; SYS_l_LastNumber)
	C_LONGINT:C283(WS_LastNoType; WS_LastNumber)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName; $_t_testClash; $3; $4; CreateSem; CREATESEM2; CREATESEM3; CREATESEM4; ID_t_Parameter6; ID_t_Parameter7)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_Code")
//Gen_Code - See also Gen_CodePref

If (<>GCUSED<=0)
	<>GCUSED:=1
	
Else 
	<>GCUSED:=<>GCUSED+1
	
End if 

WS_LastNoType:=$1
MPNUMBER:=0
If (Not:C34(In transaction:C397)) | (([IDENTIFIERS:16]Table_Number:1=$1) & (Read only state:C362([IDENTIFIERS:16])=False:C215))
	$_l_Clash:=0
	$_l_Span:=-1  //Only init if there is a clash
	CreateSem3:="CodeCrSEL"+String:C10($1)
	$Semaphoretrap:=0
	While (Semaphore:C143(CreateSem3)) & (Not:C34(<>SYS_bo_QuitCalled)) & ($Semaphoretrap<1000)
		DelayTicks(1+Abs:C99(<>GCUSED))
		$SemaphoreTrap:=$SemaphoreTrap+1
	End while 
	READ ONLY:C145([IDENTIFIERS:16])
	If ([IDENTIFIERS:16]Table_Number:1#$1)
		QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=$1)
	End if 
	If (Records in selection:C76([IDENTIFIERS:16])=0)
		QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=$1)  // in case someone else created
		If (Records in selection:C76([IDENTIFIERS:16])=0)
			READ WRITE:C146([IDENTIFIERS:16])
			CREATE RECORD:C68([IDENTIFIERS:16])
			[IDENTIFIERS:16]Table_Number:1:=$1
			DB_SaveRecord(->[IDENTIFIERS:16])
			UNLOAD RECORD:C212([IDENTIFIERS:16])
			READ ONLY:C145([IDENTIFIERS:16])
			READ WRITE:C146([IDENTIFIERS:16])
			QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=$1)
		End if 
		DelayTicks(2*Abs:C99(<>GCUSED))
	End if 
	$_bo_MultipleNos:=[IDENTIFIERS:16]Multiple_Numbers:7
	If ([IDENTIFIERS:16]Multiple_Numbers:7)
		Repeat 
			If (Not:C34(<>SYS_bo_QuitCalled))
				READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
				QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=$1)
				$_l_RecordsInSelectionMN:=Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])
				If ($_l_RecordsInSelectionMN<20)
					CreateSem:="CodeCr"+String:C10($1)+"_"
					While (Semaphore:C143(CreateSem))
						DelayTicks(2)
					End while 
					
					If (Application type:C494=4D Remote mode:K5:5)
						$_l_NewNumberProcess:=Execute on server:C373("Gen_CodeCreate"; DB_ProcessMemoryinit(4); String:C10($1); $1; *)
					Else 
						$_l_NewNumberProcess:=New process:C317("Gen_CodeCreate"; DB_ProcessMemoryinit(4); String:C10($1); $1; *)
					End if 
					Repeat 
						QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=$1)
						If (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])=0)
							If (Application type:C494=4D Remote mode:K5:5)
								$_l_NewNumberProcess:=Execute on server:C373("Gen_CodeCreate"; DB_ProcessMemoryinit(4); String:C10($1); $1; *)
							Else 
								$_l_NewNumberProcess:=New process:C317("Gen_CodeCreate"; DB_ProcessMemoryinit(4); String:C10($1); $1; *)
							End if 
						End if 
					Until (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0) | (<>SYS_bo_QuitCalled)
					CLEAR SEMAPHORE:C144(CreateSem)
				End if 
				
				QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=$1)
			Else 
				Repeat 
					CreateSem:="CodeCr"+String:C10($1)+"_"
					While (Semaphore:C143(CreateSem))
						DelayTicks(2)
					End while 
					QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=$1)
					If (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])=0)
						If (Application type:C494=4D Remote mode:K5:5)
							$_l_NewNumberProcess:=Execute on server:C373("Gen_CodeCreate"; DB_ProcessMemoryinit(4); String:C10($1); $1)
						Else 
							$_l_NewNumberProcess:=New process:C317("Gen_CodeCreate"; DB_ProcessMemoryinit(4); String:C10($1); $1)
						End if 
					End if 
					QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=$1)
					CLEAR SEMAPHORE:C144(CreateSem)
				Until (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0) | (<>SYS_bo_QuitCalled)
				QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=$1)
				
			End if 
			If (Not:C34(<>SYS_bo_QuitCalled))
				MESSAGES OFF:C175
				QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=$1)
				ORDER BY:C49([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Number:2; >)
				MESSAGES ON:C181
				FIRST RECORD:C50([IDENTIFIERS_MULTI_NUMBERS:94])
				$SemaphoreTrap:=0
				
				
				Repeat 
					If (Check_Locked(->[IDENTIFIERS_MULTI_NUMBERS:94]; 0))
						
						If (Not:C34(<>SYS_bo_QuitCalled))
							If ([IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1<9000)
								If ([IDENTIFIERS_MULTI_NUMBERS:94]Number:2<=0)
									[IDENTIFIERS_MULTI_NUMBERS:94]Number:2:=1
								End if 
								
								WS_LastNumber:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2
								$0:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2
								[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1:=[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1+9000
								[IDENTIFIERS:16]Number:2:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2
								DB_SaveRecord(->[IDENTIFIERS_MULTI_NUMBERS:94])
								UNLOAD RECORD:C212([IDENTIFIERS_MULTI_NUMBERS:94])
								QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=$1; *)
								QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94];  & ; [IDENTIFIERS_MULTI_NUMBERS:94]Number:2=WS_LastNumber)
								If (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0)
									DELETE SELECTION:C66([IDENTIFIERS_MULTI_NUMBERS:94])
								End if 
								
							Else 
								$0:=0
								NEXT RECORD:C51([IDENTIFIERS_MULTI_NUMBERS:94])
							End if 
							
						End if 
						
					Else 
						
						$0:=0
						NEXT RECORD:C51([IDENTIFIERS_MULTI_NUMBERS:94])
					End if 
				Until (End selection:C36([IDENTIFIERS_MULTI_NUMBERS:94])) | ($0>0) | (<>SYS_bo_QuitCalled)
				
				DelayTicks(3*Abs:C99(<>GCUSED))
				
				READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])
			End if 
			
		Until ($0>0) | (<>SYS_bo_QuitCalled)
		
		
		//DelayTicks (3*Abs(◊GCUSED))
		
	Else 
		
		
		If (Not:C34(<>SYS_bo_QuitCalled))
			$SemaphoreTrap:=0
			
			Repeat 
				If (Check_Locked(->[IDENTIFIERS:16]; 0))
					
					READ WRITE:C146([IDENTIFIERS:16])
					LOAD RECORD:C52([IDENTIFIERS:16])
					If (Not:C34(<>SYS_bo_QuitCalled))
						If ([IDENTIFIERS:16]Number:2<0)
							[IDENTIFIERS:16]Number:2:=0
						End if 
						
						[IDENTIFIERS:16]Number:2:=[IDENTIFIERS:16]Number:2+1
						$0:=[IDENTIFIERS:16]Number:2
						DB_SaveRecord(->[IDENTIFIERS:16])
						UNLOAD RECORD:C212([IDENTIFIERS:16])
						READ ONLY:C145([IDENTIFIERS:16])
						LOAD RECORD:C52([IDENTIFIERS:16])
						$_l_OK:=1
					End if 
					
					//DelayTicks (2*Abs(◊GCUSED))
					
				Else 
					$_l_OK:=1
					
					//DelayTicks (2*Abs(◊GCUSED))
					
					SHOW PROCESS:C325(Current process:C322)
					BRING TO FRONT:C326(Current process:C322)
					Gen_Confirm("The "+[IDENTIFIERS:16]Name:3+" Number is locked by another User or Process."+Char:C90(13)+"Continue waiting?"; "Wait"; "Cancel")
					If (OK=0)
						$0:=0
						LOAD RECORD:C52([IDENTIFIERS:16])
						$_l_OK:=0
					End if 
				End if 
				
			Until ($0>0) | (OK=0) | (<>SYS_bo_QuitCalled)
			
			UNLOAD RECORD:C212([IDENTIFIERS:16])
			READ ONLY:C145([IDENTIFIERS:16])
			
			//DelayTicks (2*Abs(◊GCUSED))
		End if 
	End if 
	$_l_Clashes:=0
	Repeat 
		
		Repeat 
			If (Not:C34(<>SYS_bo_QuitCalled))
				//eg files num=0
				$_l_Clash:=0
				If ($_l_Span>0)
					$_l_testClashNum:=$_l_offset+$_l_Span
					//eg 2nd time $_l_testClashNum:=0+1000
					//``etc  ..until $_l_testClashNum not clash=10000 (eg)
				Else 
					$_l_testClashNum:=$0
					//Testclash:=0
				End if 
				
				If (Count parameters:C259>=2)
					Case of 
						: (Count parameters:C259=2)
							$_t_testClash:=String:C10($_l_testClashNum)
						: (Count parameters:C259=3)
							$_t_testClash:=$3+String:C10($_l_testClashNum)
						: (Count parameters:C259=4)
							$_t_testClash:=$3+String:C10($_l_testClashNum)+$4
					End case 
					
					If (Count parameters:C259>=2)
						$_l_TableNumber:=Table:C252($2)
						$_l_FieldNumber:=Field:C253($2)
						
						$_l_FieldType:=0
						$_l_FieldLength:=0
						$_bo_indexed:=False:C215
						GET FIELD PROPERTIES:C258($2; $_l_FieldType; $_l_FieldLength; $_bo_indexed)
						If (Not:C34($_bo_indexed)) & ($_l_FieldType#7)
							$_l_Process:=Execute on server:C373("AA_IndexoneField"; DB_ProcessMemoryinit(1); "Set Field Index"; $_l_TableNumber; $_l_FieldNumber; *)
						End if 
						
						Case of   //22
							: (Type:C295($2->)=Is longint:K8:6) | (Type:C295($2->)=Is real:K8:4) | (Type:C295($2->)=Is integer:K8:5)
								If (Not:C34($_bo_indexed))
									SET QUERY DESTINATION:C396(3; $_l_Clash)
									QUERY:C277(Table:C252($_l_TableNumber)->; $2->=Num:C11($_t_testClash))
									SET QUERY DESTINATION:C396(0)
								Else 
									$_l_NumClash:=Num:C11($_t_testClash)
									$_l_Clash:=Find in field:C653($2->; $_l_NumClash)
									If ($_l_Clash=-1)
										$_l_Clash:=0
									End if 
									
								End if 
								
							Else 
								If (Not:C34($_bo_indexed))
									SET QUERY DESTINATION:C396(3; $_l_Clash)
									QUERY:C277(Table:C252($_l_TableNumber)->; $2->=$_t_testClash)
									SET QUERY DESTINATION:C396(0)
								Else 
									$_l_Clash:=Find in field:C653($2->; $_t_testClash)
									If ($_l_Clash=-1)
										$_l_Clash:=0
									End if 
									
								End if 
						End case 
						
					End if 
					
				Else 
					$_l_Clash:=0
				End if 
				
				
				If ($_l_Clash>0)
					$_l_Clashes:=$_l_Clashes+1
					If ($_l_Span<=0)
						//eg $_l_offset:=0
						$_l_offset:=$_l_testClashNum
						$_l_Span:=1024
					Else 
						$_l_offset:=$_l_offset+$_l_Span
						If (Not:C34(<>SYS_bo_QuitCalled))
							READ WRITE:C146([IDENTIFIERS:16])
							LOAD RECORD:C52([IDENTIFIERS:16])
							If (Not:C34(<>SYS_bo_QuitCalled))
								[IDENTIFIERS:16]Number:2:=$_l_offset
								$0:=[IDENTIFIERS:16]Number:2
								DB_SaveRecord(->[IDENTIFIERS:16])
								UNLOAD RECORD:C212([IDENTIFIERS:16])
								READ ONLY:C145([IDENTIFIERS:16])
								LOAD RECORD:C52([IDENTIFIERS:16])
								$_l_OK:=1
							End if 
							
						End if 
					End if 
					
				End if 
			End if 
			
		Until ($_l_Clash=0) | (<>SYS_bo_QuitCalled)
		
		If ($_l_Span<=1)
			//there was no clash
			If ($_l_Span=1)
				$_l_Span:=0
			End if 
		Else 
			//there has been a clashe
			If ($_l_Clashes>0)
				$_l_offset:=($_l_testClashNum-$_l_Span)+1
			End if 
			$_l_Span:=Int:C8($_l_Span/2)
			
		End if 
		
		
	Until ($_l_Span<1) | (<>SYS_bo_QuitCalled)
	
	
	If ($_bo_MultipleNos)
		If ($0>WS_LastNumber)
			//need to advance them
			$_l_DIfference:=$0-WS_LastNumber
			READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
			QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=$1)
			APPLY TO SELECTION:C70([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Number:2:=[IDENTIFIERS_MULTI_NUMBERS:94]Number:2+$_l_DIfference)
		End if 
	End if 
	CLEAR SEMAPHORE:C144(CreateSem3)
	//DelayTicks (4*Abs(◊GCUSED))
Else 
	
	
	If (Not:C34(<>SYS_bo_QuitCalled))
		$_t_ProcessName:="Number Server for Process "+String:C10(Current process:C322)
		If (GenCodeProcess>0)
			PROCESS PROPERTIES:C336(GenCodeProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
			
			If ($_t_ProcessName#$_t_ProcessName)
				GenCodeProcess:=0
			End if 
		End if 
		Case of 
			: (GenCodeProcess>0)
				Case of 
					: (Count parameters:C259=1)
						SET PROCESS VARIABLE:C370(GenCodeProcess; ID_l_ParameterCount; 3)
						SET PROCESS VARIABLE:C370(GenCodeProcess; ID_l_Parameter3; $1)
						SET PROCESS VARIABLE:C370(GenCodeProcess; ID_bo_GenCodeActivate; True:C214)
						RESUME PROCESS:C320(GenCodeProcess)
						
					: (Count parameters:C259=2)
						$_l_TableNumber:=Table:C252($2)
						$_l_FieldNumber:=Field:C253($2)
						SET PROCESS VARIABLE:C370(GenCodeProcess; ID_l_ParameterCount; 5)
						SET PROCESS VARIABLE:C370(GenCodeProcess; ID_l_Parameter3; $1)
						SET PROCESS VARIABLE:C370(GenCodeProcess; ID_l_Parameter4; $_l_TableNumber)
						SET PROCESS VARIABLE:C370(GenCodeProcess; ID_l_Parameter5; $_l_FieldNumber)
						SET PROCESS VARIABLE:C370(GenCodeProcess; ID_bo_GenCodeActivate; True:C214)
						RESUME PROCESS:C320(GenCodeProcess)
					: (Count parameters:C259=3)
						$_l_TableNumber:=Table:C252($2)
						$_l_FieldNumber:=Field:C253($2)
						
						SET PROCESS VARIABLE:C370(GenCodeProcess; ID_l_ParameterCount; 6)
						SET PROCESS VARIABLE:C370(GenCodeProcess; ID_l_Parameter3; $1)
						SET PROCESS VARIABLE:C370(GenCodeProcess; ID_l_Parameter4; $_l_TableNumber)
						SET PROCESS VARIABLE:C370(GenCodeProcess; ID_l_Parameter5; $_l_FieldNumber)
						SET PROCESS VARIABLE:C370(GenCodeProcess; ID_t_Parameter6; $3)
						SET PROCESS VARIABLE:C370(GenCodeProcess; ID_bo_GenCodeActivate; True:C214)
						RESUME PROCESS:C320(GenCodeProcess)
					: (Count parameters:C259=4)
						$_l_TableNumber:=Table:C252($2)
						$_l_FieldNumber:=Field:C253($2)
						
						SET PROCESS VARIABLE:C370(GenCodeProcess; ID_l_ParameterCount; 7)
						SET PROCESS VARIABLE:C370(GenCodeProcess; ID_l_Parameter3; $1)
						SET PROCESS VARIABLE:C370(GenCodeProcess; ID_l_Parameter4; $_l_TableNumber)
						SET PROCESS VARIABLE:C370(GenCodeProcess; ID_l_Parameter5; $_l_FieldNumber)
						SET PROCESS VARIABLE:C370(GenCodeProcess; ID_t_Parameter6; $3)
						SET PROCESS VARIABLE:C370(GenCodeProcess; ID_t_Parameter7; $4)
						SET PROCESS VARIABLE:C370(GenCodeProcess; ID_bo_GenCodeActivate; True:C214)
						RESUME PROCESS:C320(GenCodeProcess)
				End case 
				
			: (Count parameters:C259=1)
				GenCodeProcess:=New process:C317("GEN_CODE_PROCESS"; DB_ProcessMemoryinit(4); $_t_ProcessName; Current process:C322; ""; $1)
			: (Count parameters:C259=2)
				$_l_TableNumber:=Table:C252($2)
				$_l_FieldNumber:=Field:C253($2)
				GenCodeProcess:=New process:C317("GEN_CODE_PROCESS"; DB_ProcessMemoryinit(4); $_t_ProcessName; Current process:C322; ""; $1; $_l_TableNumber; $_l_FieldNumber)
			: (Count parameters:C259=3)
				$_l_TableNumber:=Table:C252($2)
				$_l_FieldNumber:=Field:C253($2)
				GenCodeProcess:=New process:C317("GEN_CODE_PROCESS"; DB_ProcessMemoryinit(4); $_t_ProcessName; Current process:C322; ""; $1; $_l_TableNumber; $_l_FieldNumber; $3)
			: (Count parameters:C259=4)
				$_l_TableNumber:=Table:C252($2)
				$_l_FieldNumber:=Field:C253($2)
				GenCodeProcess:=New process:C317("GEN_CODE_PROCESS"; DB_ProcessMemoryinit(4); $_t_ProcessName; Current process:C322; ""; $1; $_l_TableNumber; $_l_FieldNumber; $3; $4)
		End case 
		$_l_Repeats:=0
		$_bo_WindowOpen:=False:C215
		$_l_GCIncrease:=0
		
		Repeat 
			$_l_Repeats:=$_l_Repeats+1
			PROCESS PROPERTIES:C336(GenCodeProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
			
			If ($_l_ProcessState>=0) & (MPNUMBER=0) & ($_t_ProcessName=$_t_ProcessName)
				DelayTicks(60)
				RESUME PROCESS:C320(GenCodeProcess)
				
				Case of 
					: ($_l_Repeats>(Abs:C99(<>GCUSED)+30)) & ($_l_Repeats<200) & (Application type:C494#4D Server:K5:6)
						If ($_bo_WindowOpen=False:C215)
							Open window:C153(80; 80; 300; 110; -1984)
							$_bo_WindowOpen:=True:C214
						End if 
						ERASE WINDOW:C160
						Case of 
							: (<>GCUSED>500)
								MESSAGE:C88("Creating Additional Multiple Numbers-Please wait")
							: (<>GCUSED>60)
								MESSAGE:C88("Creating Additional Multiple Numbers on server-Please wait")
							: (<>GCUSED<$_l_Repeats)
								MESSAGE:C88("Waiting For Number: "+String:C10($_l_Repeats)+" tries")
								$_l_GCIncrease:=$_l_GCIncrease+10
								
						End case 
						
					: ($_l_Repeats>200)
						Case of 
							: (Count parameters:C259=1)
								MPNUMBER:=GenCodeBreakout($1)
								
							: (Count parameters:C259=2)
								MPNUMBER:=GenCodeBreakout($1; $2)
							: (Count parameters:C259=3)
								MPNUMBER:=GenCodeBreakout($1; $2; $3)
							: (Count parameters:C259=4)
								MPNUMBER:=GenCodeBreakout($1; $2; $3; $4)
						End case 
						
						
				End case 
			Else 
				If (($_l_ProcessState<0) | ($_t_ProcessName#$_t_ProcessName)) & (MPNUMBER=0)
					GenCodeProcess:=0
					$_t_ProcessName:="Number Server for Process "+String:C10(Current process:C322)
					
					Case of 
						: (Count parameters:C259=1)
							GenCodeProcess:=New process:C317("GEN_CODE_PROCESS"; DB_ProcessMemoryinit(4); $_t_ProcessName; Current process:C322; ""; $1)
						: (Count parameters:C259=2)
							$_l_TableNumber:=Table:C252($2)
							$_l_FieldNumber:=Field:C253($2)
							GenCodeProcess:=New process:C317("GEN_CODE_PROCESS"; DB_ProcessMemoryinit(4); $_t_ProcessName; Current process:C322; ""; $1; $_l_TableNumber; $_l_FieldNumber)
						: (Count parameters:C259=3)
							$_l_TableNumber:=Table:C252($2)
							$_l_FieldNumber:=Field:C253($2)
							GenCodeProcess:=New process:C317("GEN_CODE_PROCESS"; DB_ProcessMemoryinit(4); $_t_ProcessName; Current process:C322; ""; $1; $_l_TableNumber; $_l_FieldNumber; $3)
						: (Count parameters:C259=4)
							$_l_TableNumber:=Table:C252($2)
							$_l_FieldNumber:=Field:C253($2)
							GenCodeProcess:=New process:C317("GEN_CODE_PROCESS"; DB_ProcessMemoryinit(4); $_t_ProcessName; Current process:C322; ""; $1; $_l_TableNumber; $_l_FieldNumber; $3; $4)
					End case 
					
				End if 
				
			End if 
			$_l_ProcessState:=Process state:C330(GenCodeProcess)
		Until ($_l_ProcessState<0) | (MPNUMBER>0) | (<>SYS_bo_QuitCalled)
		If ($_bo_WindowOpen)
			CLOSE WINDOW:C154
		End if 
		
		If ($_l_ProcessState=0)
		End if 
		
		WS_LastNumber:=SYS_l_LastNumber
		SYS_l_LastNumber:=0
		$0:=MPNUMBER
		$_l_MPNumber:=MPNUMBER
		MPNUMBER:=0
	End if 
	
	
	//While (Test semaphore($CreateSem4))
	//Delayticks(2+◊GCUsed)
	//End while
	
	
	
	
	// MESSAGE($method+"Retrieved next record number")
End if 
<>GCUSED:=<>GCUSED-1
ERR_MethodTrackerReturn("Gen_Code"; $_t_oldMethodName)