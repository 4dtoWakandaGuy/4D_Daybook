//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StatsView Print
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
	//ARRAY LONGINT(aSV2;0)
	//ARRAY REAL(aSV3;0)
	//ARRAY REAL(aSV4;0)
	//ARRAY TEXT(aSV1;0)
	//ARRAY TEXT(aSVN1;0)
	//ARRAY TEXT(DB_at_TableName;0)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_Index; $_l_OK; $_l_SizeofArray; bd12)
	C_REAL:C285(vTot1; vTot2; vTot3)
	C_TEXT:C284($_t_oldMethodName; vTitle1; vTitle10)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView Print")
//StatsView Print

<>SYS_l_CancelProcess:=0
If (bd12=1)
	StatsView_Cal2
	bd12:=0
End if 
If (<>SYS_l_CancelProcess#Current process:C322)
	vTitle1:=DB_at_TableName{1}+" STATISTICS"
	vTitle1:=Gen_Request("Report Title: "; vTitle1)
	If (OK=1)
		StatsView_Title
		$_l_OK:=PRINT_SetSIZE("A4"; "P"; Vtitle1)
		// PAGE SETUP([COMPANIES];"SV PrintHdr")
		
		//PRINT SETTINGS
		If ($_l_OK>=0)  // See comming in Print_setSize abouthis
			Print form:C5([COMPANIES:2]; "SV PrintHdr")
			$_l_SizeofArray:=Size of array:C274(aSV1)
			$_l_Index:=1
			While (($_l_Index<=$_l_SizeofArray) & (<>SYS_l_CancelProcess#Current process:C322))
				IDLE:C311  // 7/04/03 pb
				vTitle10:=aSV1{$_l_Index}
				If (aSVN1{$_l_Index}#aSV1{$_l_Index})
					vTitle10:=vTitle10+" - "+aSVN1{$_l_Index}
				End if 
				vTot1:=aSV2{$_l_Index}
				vTot2:=aSV3{$_l_Index}
				vTot3:=aSV4{$_l_Index}
				Print form:C5([COMPANIES:2]; "SV PrintDet")
				$_l_Index:=$_l_Index+1
			End while 
			Print form:C5([COMPANIES:2]; "SV PrintFtr")
			PAGE BREAK:C6
			PRT_SetPrinterPaperOptions(Vtitle1)  //NG June 2005
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("StatsView Print"; $_t_oldMethodName)
