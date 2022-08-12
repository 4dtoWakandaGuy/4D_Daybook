//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_Validate
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
	//ARRAY INTEGER(EW_ai_ExportOrder;0)
	//ARRAY INTEGER(EW_ai_StepDetailOrder;0)
	//ARRAY TEXT(EW_at_AllBKFieldMapNames;0)
	//ARRAY TEXT(EW_at_AllDBFieldMapNames;0)
	//ARRAY TEXT(EW_at_ExportFields;0)
	//ARRAY TEXT(EW_at_TabControl;0)
	C_BOOLEAN:C305($_bo_OK; $0)
	C_LONGINT:C283($_l_FieldLocation; $_l_FieldLocation2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_Validate")
// EW_Validate
// Validation for Export Projects
// 11/09/02 pb

$_bo_OK:=False:C215
Case of 
	: ([EW_ExportProjects:117]ProjectName:1="")
		//  ALERT("Please enter a Project Name.")
		Gen_Alert("Please enter a Project Name.")
		FORM GOTO PAGE:C247(1)
		GOTO OBJECT:C206([EW_ExportProjects:117]ProjectName:1)
	: (Size of array:C274(EW_ai_ExportOrder)=0)
		Gen_Alert("Please create at least one Step.")
		FORM GOTO PAGE:C247(1)
	: (EW_at_TabControl=2) & (Size of array:C274(EW_ai_StepDetailOrder)=0)
		Gen_Alert("Please set up at least one Detail for this Action.")
		FORM GOTO PAGE:C247(2)
	: (([EW_ExportProjects:117]AutoRun:3) & ([EW_ExportProjects:117]AutoRunPeriod:4=0))
		ALERT:C41("Please specify a period.")
		Gen_Alert("Please specify a period.")
		FORM GOTO PAGE:C247(1)
		GOTO OBJECT:C206([EW_ExportProjects:117]AutoRunPeriod:4)
	: (([EW_ExportProjects:117]AutoRun:3) & ([EW_ExportProjects:117]ExportFolderName:9=""))
		Gen_Alert("Please specify a folder for the automatic export files.")
		FORM GOTO PAGE:C247(3)
	: ([EW_ExportProjects:117]ErrorReportHandling:21[[2]]="1") & ([EW_ExportProjects:117]ErrorReportEmailAddress:18="")
		Gen_Alert("Please specify an email address for the error alerts.")
		FORM GOTO PAGE:C247(3)
		GOTO OBJECT:C206([EW_ExportProjects:117]ErrorReportEmailAddress:18)
	: ([EW_ExportProjects:117]ErrorReportHandling:21[[3]]="1") & ([EW_ExportProjects:117]ErrorReportMobileNumber:19="")
		Gen_Alert("Please specify a mobile number for the error alerts.")
		FORM GOTO PAGE:C247(3)
		GOTO OBJECT:C206([EW_ExportProjects:117]ErrorReportMobileNumber:19)
	: ([EW_ExportProjects:117]ErrorReportHandling:21[[4]]="1") & ([EW_ExportProjects:117]ErrorReportDiaryName:20="")
		Gen_Alert("Please specify a person to receive the error alerts.")
		FORM GOTO PAGE:C247(3)
	: ([EW_ExportProjects:117]Exportformat:7="daybook ecommerce") & ([EW_ExportProjects:117]BKIPAddress:22="")
		Gen_Alert("Please specify the IP address for your ecommerce server.")
		FORM GOTO PAGE:C247(4)
		GOTO OBJECT:C206([EW_ExportProjects:117]BKIPAddress:22)
	: ([EW_ExportProjects:117]Exportformat:7="daybook ecommerce") & ([EW_ExportProjects:117]BKServerPort:23=0)
		Gen_Alert("Please specify the port for your ecommerce server.")
		FORM GOTO PAGE:C247(4)
		GOTO OBJECT:C206([EW_ExportProjects:117]BKServerPort:23)
	: ([EW_ExportProjects:117]Exportformat:7="daybook ecommerce") & ([EW_ExportProjects:117]BKStoreCode:24="")
		Gen_Alert("Please specify the Store Code for your ecommerce server.")
		FORM GOTO PAGE:C247(4)
		GOTO OBJECT:C206([EW_ExportProjects:117]BKStoreCode:24)
		
	: ([EW_ExportProjects:117]Exportformat:7="daybook ecommerce")  // this must be the LAST case statement
		Case of 
			: ([EW_ExportProjects:117]BKTimeout:30<3)  // 30/07/03 pb
				Gen_Alert("The Timeout value must be at least 3 seconds.")
				$_bo_OK:=False:C215
				FORM GOTO PAGE:C247(4)
				GOTO OBJECT:C206([EW_ExportProjects:117]BKTimeout:30)
			: ([EW_ExportProjects:117]BKMaxDuration:31<3)  // 30/07/03 pb
				Gen_Alert("The Maximum Duration value must be at least 3 seconds.")
				$_bo_OK:=False:C215
				FORM GOTO PAGE:C247(4)
				GOTO OBJECT:C206([EW_ExportProjects:117]BKMaxDuration:31)
				
				//     : ([EW_ExportSteps]BKModelName="items")
			: ([EW_ExportTables:120]TableNumber:3=Table:C252(->[PRODUCTS:9]))
				$_l_FieldLocation:=Find in array:C230(EW_at_AllBKFieldMapNames; "C04")  // 20/09/03
				$_bo_OK:=True:C214
				Case of 
					: ($_l_FieldLocation<1)
						Gen_Alert("The ecommerce field C04 must be included, and it must be the first Detail to be"+" exported.")
						$_bo_OK:=False:C215
					Else 
						$_l_FieldLocation2:=Find in array:C230(EW_at_ExportFields; EW_at_AllDBFieldMapNames{$_l_FieldLocation})
						Case of 
							: ($_l_FieldLocation2<1)
								Gen_Alert("The ecommerce field C04 must be included, and it must be the first Detail to be"+" exported.")
								$_bo_OK:=False:C215
							: ($_l_FieldLocation2>1)
								Gen_Alert("The field C04 must be the First_Field exported.")
								$_bo_OK:=False:C215
							Else 
						End case 
				End case 
				
				If ($_bo_OK)
					$_l_FieldLocation:=Find in array:C230(EW_at_AllBKFieldMapNames; "T01")  // 13/10/03 pb
					$_bo_OK:=True:C214
					Case of 
						: ($_l_FieldLocation<1)
							Gen_Alert("The ecommerce field T01(Product Name)  must be included.")
							$_bo_OK:=False:C215
						Else 
							$_l_FieldLocation:=Find in array:C230(EW_at_ExportFields; EW_at_AllDBFieldMapNames{$_l_FieldLocation})
							Case of 
								: ($_l_FieldLocation<1)
									Gen_Alert("The ecommerce field T01(Product Name)  must be included, and it must be the "+"second Detail to be exported.")
									$_bo_OK:=False:C215
								: ($_l_FieldLocation>2)
									Gen_Alert("The field T01 must be the second field exported.")
									$_bo_OK:=False:C215
							End case 
					End case 
				End if 
				
				If ($_bo_OK)
					$_l_FieldLocation:=Find in array:C230(EW_at_AllBKFieldMapNames; "Text1")  // 11/11/03 pb
					// this is a kludge for EFX data setup
					$_bo_OK:=True:C214
					Case of 
						: ($_l_FieldLocation<1)
							Gen_Alert("The ecommerce field Text1 (Description)  must be included.")
							$_bo_OK:=False:C215
						Else 
							$_l_FieldLocation:=Find in array:C230(EW_at_ExportFields; EW_at_AllDBFieldMapNames{$_l_FieldLocation})
							Case of 
								: ($_l_FieldLocation<1)
									Gen_Alert("The ecommerce field Text1 (Description)  must be included, and it must be the "+"third Detail to be exported.")
									$_bo_OK:=False:C215
								: ($_l_FieldLocation#3)
									Gen_Alert("The field Text1 must be the third field exported.")
									$_bo_OK:=False:C215
							End case 
					End case 
				End if 
				
				//     : ([EW_ExportSteps]BKModelName="customers")
			: ([EW_ExportTables:120]TableNumber:3=Table:C252(->[CONTACTS:1]))
				//`      $_l_FieldLocation:=Find in array(EW_at_AllBKFieldMapNames;"Cuscode")
				$_l_FieldLocation:=Find in array:C230(EW_at_AllBKFieldMapNames; "cuspersoa1")
				$_bo_OK:=True:C214
				Case of 
					: ($_l_FieldLocation<1)
						Gen_Alert("The ecommerce field CusPersoA1 must be included, and it must be the first Detail"+" to be exported.")
						$_bo_OK:=False:C215
					Else 
						$_l_FieldLocation2:=Find in array:C230(EW_at_ExportFields; EW_at_AllDBFieldMapNames{$_l_FieldLocation})
						Case of 
							: ($_l_FieldLocation2<1)
								Gen_Alert("The ecommerce field CusPersoA1 must be included, and it must be the first Detail"+" to be exported.")
								$_bo_OK:=False:C215
							: ($_l_FieldLocation2>1)
								Gen_Alert("The field CusPersoA1 must be the First_Field exported.")
								$_bo_OK:=False:C215
							Else 
						End case 
				End case 
			Else   // no record selected
				$_bo_OK:=True:C214
		End case 
		
	Else   // Guess it must be OK ...
		$_bo_OK:=True:C214
End case 
$0:=$_bo_OK
ERR_MethodTrackerReturn("EW_Validate"; $_t_oldMethodName)