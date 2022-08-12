//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_ScrRepCalc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 15:35
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(a01Real2)
	//C_UNKNOWN(a01Real3)
	//C_UNKNOWN(a01Real4)
	//C_UNKNOWN(a01Real5)
	//C_UNKNOWN(a01Real6)
	//C_UNKNOWN(a01Stri1)
	//ARRAY BOOLEAN(GEN_lb_ItemsArea;0)
	ARRAY DATE:C224($_ad_Date; 0)
	ARRAY REAL:C219($_ar_DueAmount; 0)
	ARRAY TEXT:C222($_at_Columns; 0)
	ARRAY TEXT:C222($_at_Formats; 0)
	ARRAY TEXT:C222($_at_PeriodCode; 0)
	ARRAY TEXT:C222($_at_Values; 0)
	C_DATE:C307($_d_Date; vDate)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_ArrayIndex; $_l_ArraySize; $_l_CurrentRowIndex; $_l_NumberofDays; $_l_Process; $_l_Progress; $_l_SizeofArray; $_l_Unit; r1; vNo)
	C_LONGINT:C283(xNext)
	C_REAL:C285(vT2; vT3; vT4; vT5; vT6)
	C_TEXT:C284($_t_oldMethodName; $_t_Period1; $_t_Period4; INV_t_SReportTitle1; INV_t_SReportTitle2; INV_t_SReportTitle3; INV_t_SReportTitle4; INV_t_SReportTitle5; INV_t_SReportTitle6; INV_t_SReportvalue1; INV_t_SReportvalue2)
	C_TEXT:C284(INV_t_SReportvalue3; INV_t_SReportvalue4; INV_t_SReportvalue5; INV_t_SReportvalue6; vTitle; vtitle4; vTitle5; vTitle6; vTitle7; vTitle8)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_ScrRepCalc")

$_l_Progress:=Progress2_Start("Calculating ...")
If ($_l_Progress>0)
	$_l_Process:=$_l_Progress
Else 
	$_l_Process:=Current process:C322
End if 
$_l_SizeofArray:=Size of array:C274(a01Stri1)
$_l_Unit:=Int:C8($_l_SizeofArray/10)
$_l_CurrentRowIndex:=1
vT2:=0
vT3:=0
vT4:=0
vT5:=0
vT6:=0

If (xNext=1)
	Case of 
		: (vTitle=Term_SLPLWT("Debtors@"))
			COPY NAMED SELECTION:C331([INVOICES:39]; "Scr")
		: (vTitle=Term_SLPLWT("Debtors@"))
			COPY NAMED SELECTION:C331([PURCHASE_INVOICES:37]; "Scr")
	End case 
End if 

While (($_l_CurrentRowIndex<=$_l_SizeofArray) & (<>SYS_l_CancelProcess#$_l_Process))
	IDLE:C311  // 03/04/03 pb
	Gen_ScrRepSrc($_l_CurrentRowIndex)
	
	If (r1=1)
		Case of 
			: (vTitle=Term_SLPLWT("Debtors@"))
				a01Real2{$_l_CurrentRowIndex}:=Gen_Round((Sum:C1([INVOICES:39]Total_Due:7)); 2; 2)
				SELECTION TO ARRAY:C260([INVOICES:39]Invoice_Date:4; $_ad_Date; [INVOICES:39]Total_Due:7; $_ar_DueAmount)
			: (vTitle=Term_SLPLWT("Creditors@"))
				a01Real2{$_l_CurrentRowIndex}:=Gen_Round((Sum:C1([PURCHASE_INVOICES:37]Total_Due:9)); 2; 2)
				SELECTION TO ARRAY:C260([PURCHASE_INVOICES:37]Invoice_Date:5; $_ad_Date; [PURCHASE_INVOICES:37]Total_Due:9; $_ar_DueAmount)
		End case 
	Else 
		Case of 
			: (vTitle=Term_SLPLWT("Debtors@"))
				a01Real2{$_l_CurrentRowIndex}:=Gen_Round((Sum:C1([INVOICES:39]Total_Due:7)); 2; 2)
				SELECTION TO ARRAY:C260([INVOICES:39]Period_Code:13; $_at_PeriodCode; [INVOICES:39]Total_Due:7; $_ar_DueAmount)
			: (vTitle=Term_SLPLWT("Creditors@"))
				a01Real2{$_l_CurrentRowIndex}:=Gen_Round((Sum:C1([PURCHASE_INVOICES:37]Total_Due:9)); 2; 2)
				SELECTION TO ARRAY:C260([PURCHASE_INVOICES:37]Period_Code:3; $_at_PeriodCode; [PURCHASE_INVOICES:37]Total_Due:9; $_ar_DueAmount)
		End case 
	End if 
	
	$_l_ArraySize:=Size of array:C274($_ar_DueAmount)
	$_d_Date:=vDate
	a01Real6{$_l_CurrentRowIndex}:=0
	a01Real5{$_l_CurrentRowIndex}:=0
	a01Real4{$_l_CurrentRowIndex}:=0
	a01Real3{$_l_CurrentRowIndex}:=0
	
	If (r1=1)
		For ($_l_ArrayIndex; 1; $_l_ArraySize)
			$_l_NumberofDays:=$_d_Date-$_ad_Date{$_l_ArrayIndex}
			Case of 
				: ($_l_NumberofDays>DB_GetLedgerADStageThree)
					a01Real6{$_l_CurrentRowIndex}:=a01Real6{$_l_CurrentRowIndex}+$_ar_DueAmount{$_l_ArrayIndex}
				: (($_l_NumberofDays>DB_GetLedgerADStageTwo) & ($_l_NumberofDays<=DB_GetLedgerADStageThree))
					a01Real5{$_l_CurrentRowIndex}:=a01Real5{$_l_CurrentRowIndex}+$_ar_DueAmount{$_l_ArrayIndex}
				: (($_l_NumberofDays>DB_GetLedgerADStageOne) & ($_l_NumberofDays<=DB_GetLedgerADStageTwo))
					a01Real4{$_l_CurrentRowIndex}:=a01Real4{$_l_CurrentRowIndex}+$_ar_DueAmount{$_l_ArrayIndex}
				: ($_l_NumberofDays<=DB_GetLedgerADStageOne)
					a01Real3{$_l_CurrentRowIndex}:=a01Real3{$_l_CurrentRowIndex}+$_ar_DueAmount{$_l_ArrayIndex}
			End case 
		End for 
	Else 
		$_t_Period1:=Substring:C12(vTitle5; 4; 99)
		$_t_Period4:=Substring:C12(vTitle8; 6; 99)
		For ($_l_ArrayIndex; 1; $_l_ArraySize)
			Case of 
				: ($_at_PeriodCode{$_l_ArrayIndex}<=$_t_Period1)
					a01Real3{$_l_CurrentRowIndex}:=a01Real3{$_l_CurrentRowIndex}+$_ar_DueAmount{$_l_ArrayIndex}
				: ($_at_PeriodCode{$_l_ArrayIndex}=vTitle6)
					a01Real4{$_l_CurrentRowIndex}:=a01Real4{$_l_CurrentRowIndex}+$_ar_DueAmount{$_l_ArrayIndex}
				: ($_at_PeriodCode{$_l_ArrayIndex}=vTitle7)
					a01Real5{$_l_CurrentRowIndex}:=a01Real5{$_l_CurrentRowIndex}+$_ar_DueAmount{$_l_ArrayIndex}
				: ($_at_PeriodCode{$_l_ArrayIndex}>=$_t_Period4)
					a01Real6{$_l_CurrentRowIndex}:=a01Real6{$_l_CurrentRowIndex}+$_ar_DueAmount{$_l_ArrayIndex}
			End case 
		End for 
	End if 
	
	vT2:=vT2+a01Real2{$_l_CurrentRowIndex}
	vT3:=vT3+a01Real3{$_l_CurrentRowIndex}
	vT4:=vT4+a01Real4{$_l_CurrentRowIndex}
	vT5:=vT5+a01Real5{$_l_CurrentRowIndex}
	vT6:=vT6+a01Real6{$_l_CurrentRowIndex}
	If (($_l_CurrentRowIndex/$_l_Unit)=Int:C8($_l_CurrentRowIndex/$_l_Unit))
		Progress2_Call($_l_Progress; "Calculating "+String:C10($_l_CurrentRowIndex)+" of "+String:C10($_l_SizeofArray); $_l_CurrentRowIndex; $_l_SizeofArray)
	End if 
	$_l_CurrentRowIndex:=$_l_CurrentRowIndex+1
End while 

Progress2_Call($_l_Progress; "")
//nb: the selection is not cleared cos is used in the area's script
//AL_UpdateArrays (eALContI;-2)
vNo:=$_l_SizeofArray
ARRAY TEXT:C222($_at_Columns; 8)
ARRAY TEXT:C222($_at_Values; 8)
ARRAY TEXT:C222($_at_Formats; 8)
$_at_Columns{1}:="Total Companies"
$_at_Values{1}:=String:C10(VNo)
$_at_Formats{1}:=""

$_at_Columns{2}:=vtitle4
$_at_Values{2}:=String:C10(VT2)
$_at_Formats{2}:="|Accounts"
$_at_Columns{3}:=vtitle5
$_at_Values{3}:=String:C10(VT3)
$_at_Formats{3}:="|Accounts"
$_at_Columns{4}:=vtitle6
$_at_Values{4}:=String:C10(VT4)
$_at_Formats{4}:="|Accounts"
$_at_Columns{5}:=vtitle7
$_at_Values{5}:=String:C10(VT5)
$_at_Formats{5}:="|Accounts"
$_at_Columns{6}:=vtitle8
$_at_Values{6}:=String:C10(VT6)
$_at_Formats{6}:="|Accounts"
ARRAY TEXT:C222($_at_Columns; 6)
ARRAY TEXT:C222($_at_Values; 6)
ARRAY TEXT:C222($_at_Formats; 6)

//AL_SetFooters (eALContI;1;8;String(vNo);"";String(vT1;"|Accounts");String(vT2;"|Accounts");String(vT3;"|Accounts");String(vT4;"|Accounts");String(vT5;"|Accounts");String(vT6;"|Accounts"))
LBI_SetFooterByArray(->GEN_lb_ItemsArea; ->$_at_Columns; ->$_at_Values; ->$_at_Formats)
INV_t_SReportTitle1:="Total Companies"
INV_t_SReportvalue1:=String:C10(VNo)
INV_t_SReportTitle2:=vtitle4
INV_t_SReportvalue2:=String:C10(VT2; "|Accounts")
INV_t_SReportTitle3:=vtitle5
INV_t_SReportvalue3:=String:C10(VT3; "|Accounts")
INV_t_SReportTitle4:=vtitle6
INV_t_SReportvalue4:=String:C10(VT4; "|Accounts")
INV_t_SReportTitle5:=vtitle7
INV_t_SReportvalue5:=String:C10(VT5; "|Accounts")
INV_t_SReportTitle6:=vtitle8
INV_t_SReportvalue6:=String:C10(VT6; "|Accounts")
ERR_MethodTrackerReturn("Gen_ScrRepCalc"; $_t_oldMethodName)