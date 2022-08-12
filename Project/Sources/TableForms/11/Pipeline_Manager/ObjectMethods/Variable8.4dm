If (False:C215)
	//object Name: [PERSONNEL]Pipeline_Manager.Variable8
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	//ARRAY LONGINT(SP_al_ReportTypes;0)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	//ARRAY TEXT(SP_at_ReportNames;0)
	C_BOOLEAN:C305(<>NoUpdate; $_bo_Open; $_bo_OptionKey; Gen_bo_Create; GEN_Bo_ShowCreate)
	C_DATE:C307(SP_D_FilterFromDate; SP_D_FilterToDate)
	C_LONGINT:C283($_l_ReportIndex; $_l_TestPath; SP_l_GroupID; SP_l_PersonelID; SP_l_RelatedCompanyID; SP_l_SalesProjectionStateID; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_REAL:C285(SP_R_FilterProbability)
	C_TEXT:C284($_t_ApplicationDocName; $_t_CurrentActiveDirectory; Folder separator:K24:12; $_t_Document; $_t_NewPath; $_t_oldMethodName; $_t_ReportName; $_t_StructurePath; DB_t_WindowTitle; SP_t_ReportName)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Pipeline_Manager.Variable8"; Form event code:C388)
//NG August 2002
//Reports
//These are the basic reports i think we need
//need way to switch pipelines and combine them!
//(the report will be on the displayed pipeline orders)
//we might need a way to do further filters in here

//1) Performance reports
//Number of sales entered-(per sales person(if multi-person))
//Number of sales converted-(per sales person(if multi-person))
//Number of sales at each probability which have been converted
//Number of sales month on Month which converted against number entered
//
//above should be viewable as a graph or statistics and should be exportable


//2) Build in quick report template

//3) user defined templates/superreport
SP_FindPipeline(SP_l_PersonelID; SP_D_FilterFromDate; SP_D_FilterToDate; SP_R_FilterProbability; ->SP_l_SalesProjectionStateID; SP_l_RelatedCompanyID; SP_l_GroupID)

<>NoUpdate:=True:C214

//MAC
//Folder separator:=DB_DirSymbol 

$_bo_OptionKey:=Gen_Option
If (Not:C34($_bo_OptionKey))
	
	QUERY:C277([DATA_AUDITS:102]; [DATA_AUDITS:102]TABLE_NUMBER:2=-Table:C252(->[SALES_PROJECTION:113]))
	// QUERY([DATA_AUDITS]; & ;[DATA_AUDITS]DOCUMENT_NAME="SP_quickReport")
	If (Records in selection:C76([DATA_AUDITS:102])=0)  //`B
		//actually users will never go here-this is for me to build the first report
		//try to retreive from the MAC4DX or WIN4DX folders
		$_t_CurrentActiveDirectory:=Get 4D folder:C485
		$_t_StructurePath:=StructureFilePath  //Mon, Dec 18, 2006 balinderwalia: changed to work for engine version
		$_t_ApplicationDocName:=DocNameFromPath($_t_StructurePath)
		$_t_NewPath:=SP_GetreportsFolder
		//check folder
		If ($_t_NewPath#"")  //i
			//the folder is there but is the QR
			$_t_NewPath:=$_t_NewPath+Folder separator:K24:12+"Sales Pipeline"
			//need to adjust for PC
			$_l_TestPath:=Test path name:C476($_t_NewPath)
			If ($_l_TestPath=1)  //J
				//its a doc so use it
				If (Not:C34(Undefined:C82(Document)))  //T
					$_t_Document:=Document  //
				Else   //T
					$_t_Document:=""
				End if   //END T
				QR REPORT:C197([SALES_PROJECTION:113]; $_t_NewPath)
				If (Not:C34(Undefined:C82(Document)))  //U
					If (Document#" ")  //V
						If (Document#$_t_Document)  //W
							//the user saved the report
							//we now need to put it in the correct place
							MOVE DOCUMENT:C540(Document; $_t_NewPath)
							//now create the record
							$_t_ReportName:=DocNameFromPath(Document)
							CREATE RECORD:C68([DATA_AUDITS:102])
							[DATA_AUDITS:102]TABLE_NUMBER:2:=-(Table:C252(->[SALES_PROJECTION:113]))
							[DATA_AUDITS:102]DOCUMENT_NAME:5:=$_t_ReportName
							DOCUMENT TO BLOB:C525($_t_NewPath; [DATA_AUDITS:102]DATA:6)
							DB_SaveRecord(->[DATA_AUDITS:102])
							AA_CheckFileUnlocked(->[DATA_AUDITS:102]X_ID:1)
						End if   //W
					End if   //V
				End if   //U
				
			Else   //J
				//no doc so empty report
				If (Not:C34(Undefined:C82(Document)))  //T
					$_t_Document:=Document  //
				Else   //T
					$_t_Document:=""
				End if   //END T
				
				QR REPORT:C197([SALES_PROJECTION:113]; " ")
				If (Not:C34(Undefined:C82(Document)))  //U
					If (Document#" ")  //V
						If (Document#$_t_Document)  //W
							//the user saved the report
							//we now need to put it in the correct place
							MOVE DOCUMENT:C540(Document; $_t_NewPath)
							//now create the record
							$_t_ReportName:=DocNameFromPath(Document)
							CREATE RECORD:C68([DATA_AUDITS:102])
							[DATA_AUDITS:102]TABLE_NUMBER:2:=-(Table:C252(->[SALES_PROJECTION:113]))
							[DATA_AUDITS:102]DOCUMENT_NAME:5:=$_t_ReportName
							DOCUMENT TO BLOB:C525($_t_NewPath; [DATA_AUDITS:102]DATA:6)
							DB_SaveRecord(->[DATA_AUDITS:102])
							AA_CheckFileUnlocked(->[DATA_AUDITS:102]X_ID:1)
						End if   //W
					End if   //V
				End if   //U
			End if   //END J
		End if   //END i
		
		
	Else 
		//copy it from the blob and open it
		
		//many records
		//user to choose
		ARRAY TEXT:C222(SP_at_ReportNames; 0)
		ARRAY LONGINT:C221(SP_al_ReportTypes; 0)
		SELECTION TO ARRAY:C260([DATA_AUDITS:102]DOCUMENT_NAME:5; SP_at_ReportNames)
		ARRAY LONGINT:C221(SP_al_ReportTypes; Size of array:C274(SP_at_ReportNames))
		For ($_l_ReportIndex; 1; Size of array:C274(SP_at_ReportNames))
			SP_al_ReportTypes{$_l_ReportIndex}:=1
		End for 
		INSERT IN ARRAY:C227(SP_at_ReportNames; Size of array:C274(SP_at_ReportNames)+1; 1)
		INSERT IN ARRAY:C227(SP_al_ReportTypes; Size of array:C274(SP_at_ReportNames)+1; 1)
		SP_at_ReportNames{Size of array:C274(SP_at_ReportNames)}:="Pipeline Listing(Print)"
		SP_al_ReportTypes{Size of array:C274(SP_al_ReportTypes)}:=2
		INSERT IN ARRAY:C227(SP_at_ReportNames; Size of array:C274(SP_at_ReportNames)+1; 1)
		INSERT IN ARRAY:C227(SP_al_ReportTypes; Size of array:C274(SP_at_ReportNames)+1; 1)
		SP_at_ReportNames{Size of array:C274(SP_at_ReportNames)}:="Pipeline Listing(Disk)"
		SP_al_ReportTypes{Size of array:C274(SP_al_ReportTypes)}:=3
		INSERT IN ARRAY:C227(SP_at_ReportNames; Size of array:C274(SP_at_ReportNames)+1; 1)
		INSERT IN ARRAY:C227(SP_al_ReportTypes; Size of array:C274(SP_at_ReportNames)+1; 1)
		SP_at_ReportNames{Size of array:C274(SP_at_ReportNames)}:="Pipeline Detail(Print)"
		SP_al_ReportTypes{Size of array:C274(SP_al_ReportTypes)}:=4
		INSERT IN ARRAY:C227(SP_at_ReportNames; Size of array:C274(SP_at_ReportNames)+1; 1)
		INSERT IN ARRAY:C227(SP_al_ReportTypes; Size of array:C274(SP_at_ReportNames)+1; 1)
		SP_at_ReportNames{Size of array:C274(SP_at_ReportNames)}:="Pipeline Detail(A5 Print)"
		SP_al_ReportTypes{Size of array:C274(SP_al_ReportTypes)}:=4
		INSERT IN ARRAY:C227(SP_at_ReportNames; Size of array:C274(SP_at_ReportNames)+1; 1)
		INSERT IN ARRAY:C227(SP_al_ReportTypes; Size of array:C274(SP_at_ReportNames)+1; 1)
		SP_at_ReportNames{Size of array:C274(SP_at_ReportNames)}:="Status Graph(by Period)"
		SP_al_ReportTypes{Size of array:C274(SP_al_ReportTypes)}:=5
		
		
		ARRAY TEXT:C222(GEN_at_DropDownMenu; 0)
		COPY ARRAY:C226(SP_at_ReportNames; GEN_at_DropDownMenu)
		ARRAY LONGINT:C221(GEN_al_DropDownMenuID; Size of array:C274(GEN_at_DropDownMenu))
		For ($_l_ReportIndex; 1; Size of array:C274(GEN_at_DropDownMenu))
			GEN_al_DropDownMenuID{$_l_ReportIndex}:=$_l_ReportIndex
		End for 
		DB_t_WindowTitle:="Select report to print"
		WIN_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		
		WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; -1986)
		GEN_Bo_ShowCreate:=True:C214
		DIALOG:C40([USER:15]; "Gen_PopUpChoice")
		CLOSE WINDOW:C154
		WIN_l_CurrentWinRef:=WIN_l_CurrentWinRefOLD
		If (Gen_bo_Create)
			$_t_CurrentActiveDirectory:=Get 4D folder:C485
			$_t_StructurePath:=StructureFilePath
			$_t_ApplicationDocName:=DocNameFromPath($_t_StructurePath)
			$_t_NewPath:=SP_GetreportsFolder
			//check folder
			If ($_t_NewPath#"")  //i
				If (Not:C34(Undefined:C82(Document)))  //T
					$_t_Document:=Document  //
				Else   //T
					$_t_Document:=""
				End if   //END T
				
				QR REPORT:C197([SALES_PROJECTION:113]; " ")
				If (Not:C34(Undefined:C82(Document)))  //U
					If (Document#" ")  //V
						
						If (Document#$_t_Document)  //W
							//the user saved the report
							//we now need to put it in the correct place
							MOVE DOCUMENT:C540(Document; $_t_NewPath)
							$_t_ReportName:=DocNameFromPath(Document)
							CREATE RECORD:C68([DATA_AUDITS:102])
							[DATA_AUDITS:102]TABLE_NUMBER:2:=-(Table:C252(->[SALES_PROJECTION:113]))
							[DATA_AUDITS:102]DOCUMENT_NAME:5:=$_t_ReportName
							DOCUMENT TO BLOB:C525($_t_NewPath; [DATA_AUDITS:102]DATA:6)
							DB_SaveRecord(->[DATA_AUDITS:102])
							AA_CheckFileUnlocked(->[DATA_AUDITS:102]X_ID:1)
						End if   //W
					End if   //V
				End if   //U
				
			End if 
			
		Else 
			If (GEN_at_DropDownMenu>0)
				If (SP_al_ReportTypes{GEN_at_DropDownMenu}=1)
					SP_t_ReportName:=SP_at_ReportNames{GEN_at_DropDownMenu}
					QUERY:C277([DATA_AUDITS:102]; [DATA_AUDITS:102]TABLE_NUMBER:2=-Table:C252(->[SALES_PROJECTION:113]))
					QUERY:C277([DATA_AUDITS:102];  & ; [DATA_AUDITS:102]DOCUMENT_NAME:5=SP_t_ReportName)
					
					$_t_CurrentActiveDirectory:=Get 4D folder:C485
					$_t_StructurePath:=StructureFilePath
					$_t_ApplicationDocName:=DocNameFromPath($_t_StructurePath)
					Case of   //C
						: (Application type:C494=4)  //4D Client`C
							$_t_NewPath:=SP_GetreportsFolder
						: (Application type:C494<4)  //C
							$_t_NewPath:=SP_GetreportsFolder
					End case 
					$_ti_DocumentRef:=DB_CreateDocument($_t_NewPath+Folder separator:K24:12+[DATA_AUDITS:102]DOCUMENT_NAME:5)
					
					
					CLOSE DOCUMENT:C267($_ti_DocumentRef)
					If (BLOB size:C605([DATA_AUDITS:102]DATA:6)>0)
						BLOB TO DOCUMENT:C526(Document; [DATA_AUDITS:102]DATA:6)
					End if 
					
					UNLOAD RECORD:C212([DATA_AUDITS:102])
					//set the document type and creator
					QR REPORT:C197([SALES_PROJECTION:113]; $_t_NewPath+Folder separator:K24:12+[DATA_AUDITS:102]DOCUMENT_NAME:5)
				Else 
					SP_PrintSTDreport(SP_al_ReportTypes{GEN_at_DropDownMenu}; SP_l_PersonelID; SP_l_GroupID)
					
				End if 
				
			End if 
			
			$_bo_Open:=True:C214
		End if   //1end
	End if 
	
Else 
	//user wishes to create a new report
	$_t_CurrentActiveDirectory:=Get 4D folder:C485
	$_t_StructurePath:=StructureFilePath
	$_t_ApplicationDocName:=DocNameFromPath($_t_StructurePath)
	$_t_NewPath:=SP_GetreportsFolder
	//check folder
	If ($_t_NewPath#"")  //i
		If (Not:C34(Undefined:C82(Document)))  //T
			$_t_Document:=Document  //
		Else   //T
			$_t_Document:=""
		End if   //END T
		
		QR REPORT:C197([SALES_PROJECTION:113]; " ")
		If (Not:C34(Undefined:C82(Document)))  //U
			If (Document#" ")  //V
				
				If (Document#$_t_Document)  //W
					//the user saved the report
					//we now need to put it in the correct place
					MOVE DOCUMENT:C540(Document; $_t_NewPath)
					$_t_ReportName:=DocNameFromPath(Document)
					CREATE RECORD:C68([DATA_AUDITS:102])
					[DATA_AUDITS:102]TABLE_NUMBER:2:=-(Table:C252(->[SALES_PROJECTION:113]))
					[DATA_AUDITS:102]DOCUMENT_NAME:5:=$_t_ReportName
					DOCUMENT TO BLOB:C525($_t_NewPath; [DATA_AUDITS:102]DATA:6)
					DB_SaveRecord(->[DATA_AUDITS:102])
					AA_CheckFileUnlocked(->[DATA_AUDITS:102]X_ID:1)
				End if   //W
			End if   //V
		End if   //U
		
	End if 
	
	
End if 


<>NoUpdate:=False:C215
ERR_MethodTrackerReturn("OBJ:Pipeline_Manager,Breports"; $_t_oldMethodName)
