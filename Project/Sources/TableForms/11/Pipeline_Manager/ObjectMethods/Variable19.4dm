If (False:C215)
	//object Name: [PERSONNEL]Pipeline_Manager.Variable19
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2013 18:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK; $_bo_Open)
	C_LONGINT:C283($_l_PathType)
	C_TEXT:C284($_t_CurrentDocument; $_t_Databasepath; Folder separator:K24:12; $_t_DocumentName; $_t_NewPath; $_t_oldMethodName; $_t_StructurePath)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Pipeline_Manager.Variable19"; Form event code:C388)
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


//Folder separator:=DB_DirSymbol 
//A


QUERY:C277([DATA_AUDITS:102]; [DATA_AUDITS:102]TABLE_NUMBER:2=-5; *)
QUERY:C277([DATA_AUDITS:102];  & ; [DATA_AUDITS:102]DOCUMENT_NAME:5="Sales Pipeline Std Report")
If (Records in selection:C76([DATA_AUDITS:102])=0)  //`B
	//try to retreive from the MAC4DX or WIN4DX folders
	$_t_Databasepath:=Get 4D folder:C485
	$_t_StructurePath:=StructureFilePath  //Mon, Dec 18, 2006 balinderwalia: changed to work for engine version
	$_t_DocumentName:=DocNameFromPath($_t_StructurePath)
	Case of   //C
		: (Application type:C494=4)  //4D Client`C
			//check folder
			$_t_NewPath:=$_t_Databasepath+Folder separator:K24:12+$_t_DocumentName
			$_l_PathType:=Test path name:C476($_t_NewPath)
			Case of   //D
				: ($_l_PathType=0)  //D
					//this is the folder
					//now find the mac4dx or wind4dx
					$_t_NewPath:=$_t_NewPath+Folder separator:K24:12+"4DX"
					//E
					$_l_PathType:=Test path name:C476($_t_NewPath)
					Case of   //F
						: ($_l_PathType=0)  //F
							//this is the folder
							$_t_NewPath:=$_t_NewPath+Folder separator:K24:12+"QuickReports"
							$_l_PathType:=Test path name:C476($_t_NewPath)
							Case of   //G
								: ($_l_PathType=0)  //G
									$_bo_OK:=True:C214
								Else 
									//its not there so create it
									$_bo_OK:=False:C215
									CREATE FOLDER:C475($_t_NewPath)
									$_l_PathType:=Test path name:C476($_t_NewPath)
									If ($_l_PathType=0)  //H
										$_bo_OK:=True:C214
									Else   //H
										//TRACE
									End if   //END H
							End case   //END G
							If ($_bo_OK=True:C214)  //i
								//the folder is there but is the QR
								$_t_NewPath:=$_t_NewPath+Folder separator:K24:12+"Sales Pipeline"
								$_l_PathType:=Test path name:C476($_t_NewPath)
								If ($_l_PathType=1)  //J
									//its a doc so use it
									QR REPORT:C197([SALES_PROJECTION:113]; $_t_NewPath)
									READ WRITE:C146([DATA_AUDITS:102])
									CREATE RECORD:C68([DATA_AUDITS:102])
									[DATA_AUDITS:102]TABLE_NUMBER:2:=-5
									[DATA_AUDITS:102]DOCUMENT_NAME:5:="Sales Pipeline Std Report"
									DOCUMENT TO BLOB:C525($_t_NewPath; [DATA_AUDITS:102]DATA:6)
									DB_SaveRecord(->[DATA_AUDITS:102])
									AA_CheckFileUnlocked(->[DATA_AUDITS:102]X_ID:1)
									
								Else   //J
									//no doc so empty report
									$_t_CurrentDocument:=Document
									QR REPORT:C197([SALES_PROJECTION:113]; "")
									If (Document#$_t_CurrentDocument)  //K
										//the user saved the report
										//we now need to put it in the correct place
										MOVE DOCUMENT:C540(Document; $_t_NewPath)
										READ WRITE:C146([DATA_AUDITS:102])
										CREATE RECORD:C68([DATA_AUDITS:102])
										[DATA_AUDITS:102]TABLE_NUMBER:2:=-5
										[DATA_AUDITS:102]DOCUMENT_NAME:5:="Sales Pipeline Std Report"
										DOCUMENT TO BLOB:C525($_t_NewPath; [DATA_AUDITS:102]DATA:6)
										DB_SaveRecord(->[DATA_AUDITS:102])
										AA_CheckFileUnlocked(->[DATA_AUDITS:102]X_ID:1)
									End if   //End K
									
								End if   //END J
							End if   //END i
							
							//
						: ($_l_PathType=1)  //F
							//error
						Else   // F
							//its not there!!
							
					End case   // END F
					
				: ($_l_PathType=1)  //D
				Else   //3 continue`D
					//its not there so create it!
			End case   //end D
			
		: (Application type:C494<4)  //C
			
			
			$_t_NewPath:=DB_GetDocumentPath  // ($_t_StructurePath)
			//this is the folder
			//now find the mac4dx or wind4dx
			
			$_l_PathType:=Test path name:C476($_t_NewPath+"Reports")
			Case of   //n
				: ($_l_PathType=0)  //N
					//this is the folder
					$_t_NewPath:=$_t_NewPath+Folder separator:K24:12+"QuickReports"
					$_l_PathType:=Test path name:C476($_t_NewPath)
					Case of   //P
						: ($_l_PathType=0)  //P
							$_bo_OK:=True:C214
						Else   //P
							//its not there so create it
							$_bo_OK:=False:C215
							CREATE FOLDER:C475($_t_NewPath)
							$_l_PathType:=Test path name:C476($_t_NewPath)
							If ($_l_PathType=0)  //Q
								$_bo_OK:=True:C214
							Else   //Q
								//TRACE
							End if   //END Q
					End case   //end  P
					If ($_bo_OK=True:C214)  //R
						//the folder is there but is the QR
						$_t_NewPath:=$_t_NewPath+Folder separator:K24:12+"Sales Pipeline"
						$_l_PathType:=Test path name:C476($_t_NewPath)
						If ($_l_PathType=1)  //S
							//its a doc so copy it to the blob
							//   REPORT([SALES_PROJECTION];$_t_NewPath)
							READ WRITE:C146([DATA_AUDITS:102])
							CREATE RECORD:C68([DATA_AUDITS:102])
							[DATA_AUDITS:102]TABLE_NUMBER:2:=-5
							[DATA_AUDITS:102]DOCUMENT_NAME:5:="Sales Pipeline Std Report"
							DOCUMENT TO BLOB:C525($_t_NewPath; [DATA_AUDITS:102]DATA:6)
							DB_SaveRecord(->[DATA_AUDITS:102])
							AA_CheckFileUnlocked(->[DATA_AUDITS:102]X_ID:1)
							
						Else   //S
							//no doc so empty report
							If (Not:C34(Undefined:C82(Document)))  //T
								$_t_CurrentDocument:=Document  //
							Else   //T
								$_t_CurrentDocument:=""
							End if   //END T
							
							QR REPORT:C197([SALES_PROJECTION:113]; " ")
							If (Not:C34(Undefined:C82(Document)))  //U
								If (Document#" ")  //V
									
									If (Document#$_t_CurrentDocument)  //W
										//the user saved the report
										//we now need to put it in the correct place
										MOVE DOCUMENT:C540(Document; $_t_NewPath)
										READ WRITE:C146([DATA_AUDITS:102])
										CREATE RECORD:C68([DATA_AUDITS:102])
										[DATA_AUDITS:102]TABLE_NUMBER:2:=-5
										[DATA_AUDITS:102]DOCUMENT_NAME:5:="Sales Pipeline Std Report"
										DOCUMENT TO BLOB:C525($_t_NewPath; [DATA_AUDITS:102]DATA:6)
										DB_SaveRecord(->[DATA_AUDITS:102])
										AA_CheckFileUnlocked(->[DATA_AUDITS:102]X_ID:1)
									End if   //W
								End if   //V
							End if   //U
							
						End if   //EnD S
					End if   //ENd R
					
				: ($_l_PathType=1)  //N
					//error
				Else   // N
					//its not there!!
					
			End case   //End N
			
			
			
	End case   //2 end
	
Else 
	//copy it from the blob and open it
	$_bo_Open:=True:C214
End if   //1end
ERR_MethodTrackerReturn("OBJ:Pipeline_Manager,Breports"; $_t_oldMethodName)