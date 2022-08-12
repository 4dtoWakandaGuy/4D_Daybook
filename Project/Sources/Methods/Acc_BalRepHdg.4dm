//%attributes = {}
If (False:C215)
	//Project Method Name:      Acc_BalRepHdg
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Ch6; $_l_PrintHeight; $_l_PrintHeight2; $0; ch6; vItemNum; vStockLevel)
	C_REAL:C285(PrtSubHeight; vValueF)
	C_TEXT:C284($_t_LevelMinus1; $_t_oldMethodName; $1; vStage)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Acc_BalRepHdg")


$0:=0
$_l_PrintHeight2:=0
$_l_PrintHeight:=0
RELATE ONE:C42([ACCOUNTS:32]Report_Heading:1)
QUERY:C277([HEADINGS:84]; [HEADINGS:84]Heading_Code:1=[ACCOUNTS:32]Report_Heading:1)

Acc_BalReport


If ([HEADINGS:84]Heading_Level:3>vValueF)
	While ([HEADINGS:84]Heading_Level:3>vValueF)
		$_t_LevelMinus1:=[HEADINGS:84]Level_Up_Code:4
		QUERY:C277([HEADINGS:84]; [HEADINGS:84]Heading_Code:1=$_t_LevelMinus1)
		ACC_Bal_Abort
	End while 
End if 
vItemNum:=Record number:C243([HEADINGS:84])

If ((vStockLevel>1) & (vStage#""))
	If ([HEADINGS:84]Heading_Code:1#vStage)
		While ([HEADINGS:84]Heading_Code:1#vStage)
			//IDLE  ` 03/04/03 pb
			vStage:=Substring:C12(vStage; 1; Length:C16(vStage)-2)+"@"
		End while 
		vStage:=Substring:C12(vStage; 1; Length:C16(vStage)-1)
		QUERY:C277([HEADINGS:84]; [HEADINGS:84]Heading_Code:1=vStage)
		vStockLevel:=[HEADINGS:84]Heading_Level:3+1
		GOTO RECORD:C242([HEADINGS:84]; vItemNum)
	End if 
End if 

If (vStockLevel<[HEADINGS:84]Heading_Level:3)
	While (vStockLevel<[HEADINGS:84]Heading_Level:3)
		
		While ([HEADINGS:84]Heading_Level:3>vStockLevel)
			$_t_LevelMinus1:=[HEADINGS:84]Level_Up_Code:4
			QUERY:C277([HEADINGS:84]; [HEADINGS:84]Heading_Code:1=$_t_LevelMinus1)
			ACC_Bal_Abort
		End while 
		
		$_l_Ch6:=ch6
		ch6:=0
		If (Count parameters:C259>=1)
			
			//$_t_oldMethodName2:=ERR_MethodTracker ("EXECUTE: "+$1)
			//EXECUTE($1)
			Case of 
				: ($1="Acc_BalBSHdg")
					Acc_BalBSHdg(->$_l_PrintHeight2)
				: ($1="Acc_BalPLHdg")
					Acc_BalPLHdg(->$_l_PrintHeight2)
				: ($1="Acc_BalPLBHdg")
					Acc_BalPLBHdg(->$_l_PrintHeight)
				: ($1="Acc_BalPLHdg12")
					Acc_BalPLHdg12(->$_l_PrintHeight2)
				: ($1="ACC_TrialBalancePrintHeading")
					ACC_TrialBalancePrintHeading(->$_l_PrintHeight2)
					
			End case 
			$_l_PrintHeight:=$_l_PrintHeight+$_l_PrintHeight2
		End if 
		ch6:=$_l_Ch6
		
		vStockLevel:=[HEADINGS:84]Heading_Level:3+1
		GOTO RECORD:C242([HEADINGS:84]; vItemNum)
	End while 
Else 
	vStockLevel:=vStockLevel+1
End if 
vStage:=[HEADINGS:84]Level_Up_Code:4+"@"
If (vStage="")
	vStage:=[HEADINGS:84]Heading_Code:1+"@"
End if 
PrtSubHeight:=0

If (Count parameters:C259>=1)
	Case of 
		: ($1="Acc_BalBSHdg")
			Acc_BalBSHdg(->$_l_PrintHeight2)
		: ($1="Acc_BalPLHdg")
			Acc_BalPLHdg(->$_l_PrintHeight2)
		: ($1="Acc_BalPLBHdg")
			Acc_BalPLBHdg(->$_l_PrintHeight2)
		: ($1="Acc_BalPLHdg12")
			Acc_BalPLHdg12(->$_l_PrintHeight2)
		: ($1="ACC_TrialBalancePrintHeading")
			ACC_TrialBalancePrintHeading(->$_l_PrintHeight2)
			
	End case 
	$_l_PrintHeight:=$_l_PrintHeight+$_l_PrintHeight2
	PrtSubHeight:=$_l_PrintHeight
	$0:=PrtSubHeight
End if 
ERR_MethodTrackerReturn("Acc_BalRepHdg"; $_t_oldMethodName)
