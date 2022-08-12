//%attributes = {"invisible":true}

If (False:C215)
	//Project Method Name:      VER_GetVersion
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604($_blb_MyPrivateKey; $_blb_Version; $_blb_VersionBlob2; $_blb_VersionBlob3; $_blb_VersionerPublicKey; VER_blb_ResourceBlob)
	C_BOOLEAN:C305($_bo_GetDataVersion)
	C_LONGINT:C283($_l_DestinationOffset; $_l_GetDataRes; $_l_ItemID; $_l_offset; $_l_Parameters; $_l_Process; $_l_ReleaseVersion; $_l_Result; $_l_SetVersion; $_l_SourceOffset; $1)
	C_TEXT:C284(<>VER_S80_DataVersion; <>VER_T_Version; $_t_DataFilePath; $_t_DirectoryPath; $_t_DirectorySymbol; $_t_FullVersionString; $_t_NewResourcePath; $_t_oldMethodName; $_t_Place; $_t_StructureFIlePath; $_t_StructurePath)
	C_TEXT:C284($_t_VerLicenceVersionString; $_t_VersionControlPath; $0; VER_T_PrivateKEYTEXT; VER_T_PublicKEYTEXT)
	C_TIME:C306($_ti_Result)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("VER_GetVersion")

//pass $1 = 1 if want to get data file version (default is 0 which is structure
// file version from structure resource)
//This method returns the STRUCTURE(or date file) build number this may be different to the licence version


$_l_Parameters:=Count parameters:C259

$_t_oldMethodName:=ERR_MethodTracker("VER_GetVersion")
//BSW 14/08/02
While (Semaphore:C143("LOCKVERSION"))
	DelayTicks(2)
End while 

If ($_l_Parameters>=1)
	$_l_GetDataRes:=$1
Else 
	$_l_GetDataRes:=0
End if 

$_bo_GetDataVersion:=($_l_GetDataRes=1)

$_l_SourceOffset:=0

$_l_DestinationOffset:=0
While (Semaphore:C143("LOCKVERSION"))
	DelayTicks(2)
End while 
Case of 
	: (Application type:C494=4D Remote mode:K5:5)
		$_t_VerLicenceVersionString:="0000"
		
		If ($_bo_GetDataVersion)  //Get data version from resource in data file
			If (False:C215)  //just done it on startup and set version
				$_l_Process:=Execute on server:C373("VER_GetVersion"; 32000; "Get Res"; 1)
				DelayTicks(10)
			End if 
			GET PROCESS VARIABLE:C371(-1; <>VER_S80_DataVersion; $_t_VerLicenceVersionString)
		Else   //Get structure version from resource in structure file
			If (False:C215)  //just done it on startup and set version
				$_l_Process:=Execute on server:C373("VER_GetVersion"; 32000; "Get Res")
				DelayTicks(10)
			End if 
			GET PROCESS VARIABLE:C371(-1; <>VER_T_Version; $_t_VerLicenceVersionString)
		End if 
		
		$0:=$_t_VerLicenceVersionString
		
	Else 
		
		If ($_bo_GetDataVersion)
			//TRACE
			//To avoid issues..store this in the prefs table.
			
			
			$_t_VersionControlPath:=""
			$_l_ItemID:=PREF_GetPreferenceID("Version Control")
			If ($_l_ItemID>0)
				QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)  //One record for the database
				If (Records in selection:C76([PREFERENCES:116])=0)
					CREATE RECORD:C68([PREFERENCES:116])
					[PREFERENCES:116]IDNumber:1:=$_l_ItemID
					VARIABLE TO BLOB:C532($_blb_Version; [PREFERENCES:116]DataBlob:2; *)
					VARIABLE TO BLOB:C532($_blb_VersionBlob2; [PREFERENCES:116]DataBlob:2; *)
					VARIABLE TO BLOB:C532($_blb_VersionBlob3; [PREFERENCES:116]DataBlob:2; *)
					SAVE RECORD:C53([PREFERENCES:116])
				End if 
			End if 
			$_l_offset:=0
			VARIABLE TO BLOB:C532([PREFERENCES:116]DataBlob:2; $_blb_Version; $_l_offset)
			VARIABLE TO BLOB:C532([PREFERENCES:116]DataBlob:2; $_blb_VersionBlob2; $_l_offset)
			VARIABLE TO BLOB:C532([PREFERENCES:116]DataBlob:2; $_blb_VersionBlob3; $_l_offset)
			
			
			If (BLOB size:C605($_blb_VersionBlob2)>0)
				VER_T_PrivateKEYTEXT:="-----BEGIN RSA PRIVATE KEY-----"+Char:C90(10)+"MIIEowIBAAKCAQEA8CRUazeyAI1h6XXqaqiCw+LrGDh7IWF7sLU7ku3N+MDLQuwj"+Char:C90(10)+"ois37yINtIwvmtQIAh1PSV+nYOSB/iz2QQXx7vd7R842dEgRRmnEvO5oxYGClbq9"+Char:C90(10)+"FxtWCgfkJ6fBvTyorHKolII203fNm1cebMbCuW3eCUs2Aja797B9jMGMMKJZWZ75"+Char:C90(10)+"LEq6r+a6saULruRz/vZXGkbNywqrjQEfplOfKpFNWI6lBNtsDgRGegoN/PT1COKz"+Char:C90(10)+"oxgfC/FGTCPYEcPUBLGoE+jjGfyik7BqMBU/Y9p1UlVlVriKokawXpUTJpASUcLB"+Char:C90(10)+"3lhC6PofD7sua03kJTExMBuYeQk1aS82+eIYPwIDAQABAoIBAAum96GsNirosVOO"+Char:C90(10)+"sS0zuAShQh8OvorEHCha4uUiPNhRIovAwYng5vnngRq9oqG0oB7aJTq+NXTyIYyf"+Char:C90(10)+"yeMl0rNxtr2pN+M0jAIKp80zFEphGmEBiqNQZEBgWaXC8heoldaoSZ3LI7XnHkbn"+Char:C90(10)+"V0aX7mLo/dkdmSVKWpyOJ8loqtDBN9m6VToQOnGd9/vqEKe/dQ7DMt3w0Fo7u0pJ"+Char:C90(10)+"VCwZgfYTS2RAbsb+TW+i1XqY1uNLC7Nk2+SrqyIkkmsyjxlHr87gI4N5QM/JQvx1"+Char:C90(10)+"yU+Cfw4zX2+8cljl2uMwUVVxHPltOt0suga9xkLn4jMK0lmopCvGQrzq/jUhQ+Dr"+Char:C90(10)+"/rmnmyECgYEA/+rVvvwQ8Ak49ZbYea8o2iG7Wu48bLNWhHfbrSrcMjIz5zrcEdRl"+Char:C90(10)+"OZa55J6cnNwX6VH+4SUYqXW9uUdAVmK8DyTgJDKmncuhbLjkgTg0sC02QUZ50EB+"+Char:C90(10)+"3gdBGmSK5Amge47C/IIO07QyyLzw4hSXcHieTw+MvQI7afVZ6czjxr0CgYEA8Dgw"+Char:C90(10)+"rW/d+ikPiGor1xXxT/HRjkYmNbKVwsY0D9TZy6zpraOrPzCyYQByONiqLsh58map"+Char:C90(10)+"6teNe48kDI38wr5DQPcB8lyHKJAzs5976Iq6/9yau69zFSO7yNvPchd3y7qLa2sf"+Char:C90(10)+"ZHpAA+vUxdODV+R6u3MPTMeLEEOldkPdDuT/OKsCgYBHjs1nkqnVxG5l1WEAXWbp"+Char:C90(10)+"32a43UaOCnNVpQIK4KIjcwAqVr30SlRnjuq5r1QRVEVnWyMOp0XHFIIRTYgC36bA"+Char:C90(10)+"AUqfNH58PtULRoO2UhYBcRLrm54yCeavhI3CqHxhmQODqP6ChodI0OkmUhZ00Ncr"+Char:C90(10)+"fr6dUrbCnt4oGY+jnUPPbQKBgQDRnBZNoImPWfjlzc8HVWxFl/qFLQz2Wih31r9i"+Char:C90(10)+"+RY6tV0KWQB6mSFtpxgEJnsJa4GNVKv78a7RHCwWkGb3/1FsBJ08QCTn7jxPBmD2"+Char:C90(10)+"nudhj7us/gFrdszLDZLMOVIdAV/akZTI9iuZwFTfchrvvLyjiFjXZF8iCAT/V2Qz"+Char:C90(10)+"NPrHFQKBgCaslIy5BtpzUER2CPBGLiDqRMqFjDBDfSLYrbt9D/pba93FHJUqH1wZ"+Char:C90(10)+"YcbevSGalnudYnxSIMG+grCb9x9SLw3o0eWAoGkSoeWIVU6E0O5vETmtANtX9GtI"+Char:C90(10)+"G/NIdxB6HjM6M/SfFvqWEU2UBBxSArq6s69eTKoEgNDYt22LTYKU"+Char:C90(10)+"-----END RSA PRIVATE KEY-----"+Char:C90(10)+""
				VER_T_PublicKEYTEXT:="-----BEGIN RSA PUBLIC KEY-----"+Char:C90(10)+"MIIBCgKCAQEA8CRUazeyAI1h6XXqaqiCw+LrGDh7IWF7sLU7ku3N+MDLQuwjois3"+Char:C90(10)+"7yINtIwvmtQIAh1PSV+nYOSB/iz2QQXx7vd7R842dEgRRmnEvO5oxYGClbq9FxtW"+Char:C90(10)+"CgfkJ6fBvTyorHKolII203fNm1cebMbCuW3eCUs2Aja797B9jMGMMKJZWZ75LEq6"+Char:C90(10)+"r+a6saULruRz/vZXGkbNywqrjQEfplOfKpFNWI6lBNtsDgRGegoN/PT1COKzoxgf"+Char:C90(10)+"C/FGTCPYEcPUBLGoE+jjGfyik7BqMBU/Y9p1UlVlVriKokawXpUTJpASUcLB3lhC"+Char:C90(10)+"6PofD7sua03kJTExMBuYeQk1aS82+eIYPwIDAQAB"+Char:C90(10)+"-----END RSA PUBLIC KEY-----"+Char:C90(10)+""
				TEXT TO BLOB:C554(VER_T_PrivateKEYTEXT; $_blb_MyPrivateKey)
				TEXT TO BLOB:C554(VER_T_PublicKEYTEXT; $_blb_VersionerPublicKey)
				DECRYPT BLOB:C690($_blb_VersionBlob2; $_blb_VersionerPublicKey)
				$_l_offset:=0
				$_l_SetVersion:=BLOB to longint:C551($_blb_VersionBlob2; Macintosh byte ordering:K22:2; $_l_offset)
				$_l_ReleaseVersion:=BLOB to longint:C551($_blb_VersionBlob2; Macintosh byte ordering:K22:2; $_l_offset)
				$_t_Place:=BLOB to text:C555($_blb_VersionBlob2; Mac Pascal string:K22:8; $_l_offset)
				$_t_VerLicenceVersionString:=BLOB to text:C555($_blb_VersionBlob2; Mac Pascal string:K22:8; $_l_offset)
				$_t_FullVersionString:=BLOB to text:C555($_blb_VersionBlob2; Mac Pascal string:K22:8; $_l_offset)
			Else 
				//this must be the first time this data file has been opened with a V13 version
				
				//use the structure version data.
				//TRACE
				Begin SQL
					USE LOCAL DATABASE DATAFILE <<$_t_VersionControlPath>> auto_close;
					SELECT  VER_DATA
					FROM VERSION_INFORMATION
					WHERE BIT_LENGTH(VER_STRING) > 0
					INTO :$_blb_Version, :$_blb_VersionBlob2, :$_blb_VersionBlob3;
					USE DATABASE SQL_INTERNAL;
				End SQL
				If (BLOB size:C605($_blb_VersionBlob2)>0)
					VER_T_PrivateKEYTEXT:="-----BEGIN RSA PRIVATE KEY-----"+Char:C90(10)+"MIIEowIBAAKCAQEA8CRUazeyAI1h6XXqaqiCw+LrGDh7IWF7sLU7ku3N+MDLQuwj"+Char:C90(10)+"ois37yINtIwvmtQIAh1PSV+nYOSB/iz2QQXx7vd7R842dEgRRmnEvO5oxYGClbq9"+Char:C90(10)+"FxtWCgfkJ6fBvTyorHKolII203fNm1cebMbCuW3eCUs2Aja797B9jMGMMKJZWZ75"+Char:C90(10)+"LEq6r+a6saULruRz/vZXGkbNywqrjQEfplOfKpFNWI6lBNtsDgRGegoN/PT1COKz"+Char:C90(10)+"oxgfC/FGTCPYEcPUBLGoE+jjGfyik7BqMBU/Y9p1UlVlVriKokawXpUTJpASUcLB"+Char:C90(10)+"3lhC6PofD7sua03kJTExMBuYeQk1aS82+eIYPwIDAQABAoIBAAum96GsNirosVOO"+Char:C90(10)+"sS0zuAShQh8OvorEHCha4uUiPNhRIovAwYng5vnngRq9oqG0oB7aJTq+NXTyIYyf"+Char:C90(10)+"yeMl0rNxtr2pN+M0jAIKp80zFEphGmEBiqNQZEBgWaXC8heoldaoSZ3LI7XnHkbn"+Char:C90(10)+"V0aX7mLo/dkdmSVKWpyOJ8loqtDBN9m6VToQOnGd9/vqEKe/dQ7DMt3w0Fo7u0pJ"+Char:C90(10)+"VCwZgfYTS2RAbsb+TW+i1XqY1uNLC7Nk2+SrqyIkkmsyjxlHr87gI4N5QM/JQvx1"+Char:C90(10)+"yU+Cfw4zX2+8cljl2uMwUVVxHPltOt0suga9xkLn4jMK0lmopCvGQrzq/jUhQ+Dr"+Char:C90(10)+"/rmnmyECgYEA/+rVvvwQ8Ak49ZbYea8o2iG7Wu48bLNWhHfbrSrcMjIz5zrcEdRl"+Char:C90(10)+"OZa55J6cnNwX6VH+4SUYqXW9uUdAVmK8DyTgJDKmncuhbLjkgTg0sC02QUZ50EB+"+Char:C90(10)+"3gdBGmSK5Amge47C/IIO07QyyLzw4hSXcHieTw+MvQI7afVZ6czjxr0CgYEA8Dgw"+Char:C90(10)+"rW/d+ikPiGor1xXxT/HRjkYmNbKVwsY0D9TZy6zpraOrPzCyYQByONiqLsh58map"+Char:C90(10)+"6teNe48kDI38wr5DQPcB8lyHKJAzs5976Iq6/9yau69zFSO7yNvPchd3y7qLa2sf"+Char:C90(10)+"ZHpAA+vUxdODV+R6u3MPTMeLEEOldkPdDuT/OKsCgYBHjs1nkqnVxG5l1WEAXWbp"+Char:C90(10)+"32a43UaOCnNVpQIK4KIjcwAqVr30SlRnjuq5r1QRVEVnWyMOp0XHFIIRTYgC36bA"+Char:C90(10)+"AUqfNH58PtULRoO2UhYBcRLrm54yCeavhI3CqHxhmQODqP6ChodI0OkmUhZ00Ncr"+Char:C90(10)+"fr6dUrbCnt4oGY+jnUPPbQKBgQDRnBZNoImPWfjlzc8HVWxFl/qFLQz2Wih31r9i"+Char:C90(10)+"+RY6tV0KWQB6mSFtpxgEJnsJa4GNVKv78a7RHCwWkGb3/1FsBJ08QCTn7jxPBmD2"+Char:C90(10)+"nudhj7us/gFrdszLDZLMOVIdAV/akZTI9iuZwFTfchrvvLyjiFjXZF8iCAT/V2Qz"+Char:C90(10)+"NPrHFQKBgCaslIy5BtpzUER2CPBGLiDqRMqFjDBDfSLYrbt9D/pba93FHJUqH1wZ"+Char:C90(10)+"YcbevSGalnudYnxSIMG+grCb9x9SLw3o0eWAoGkSoeWIVU6E0O5vETmtANtX9GtI"+Char:C90(10)+"G/NIdxB6HjM6M/SfFvqWEU2UBBxSArq6s69eTKoEgNDYt22LTYKU"+Char:C90(10)+"-----END RSA PRIVATE KEY-----"+Char:C90(10)+""
					VER_T_PublicKEYTEXT:="-----BEGIN RSA PUBLIC KEY-----"+Char:C90(10)+"MIIBCgKCAQEA8CRUazeyAI1h6XXqaqiCw+LrGDh7IWF7sLU7ku3N+MDLQuwjois3"+Char:C90(10)+"7yINtIwvmtQIAh1PSV+nYOSB/iz2QQXx7vd7R842dEgRRmnEvO5oxYGClbq9FxtW"+Char:C90(10)+"CgfkJ6fBvTyorHKolII203fNm1cebMbCuW3eCUs2Aja797B9jMGMMKJZWZ75LEq6"+Char:C90(10)+"r+a6saULruRz/vZXGkbNywqrjQEfplOfKpFNWI6lBNtsDgRGegoN/PT1COKzoxgf"+Char:C90(10)+"C/FGTCPYEcPUBLGoE+jjGfyik7BqMBU/Y9p1UlVlVriKokawXpUTJpASUcLB3lhC"+Char:C90(10)+"6PofD7sua03kJTExMBuYeQk1aS82+eIYPwIDAQAB"+Char:C90(10)+"-----END RSA PUBLIC KEY-----"+Char:C90(10)+""
					TEXT TO BLOB:C554(VER_T_PrivateKEYTEXT; $_blb_MyPrivateKey)
					TEXT TO BLOB:C554(VER_T_PublicKEYTEXT; $_blb_VersionerPublicKey)
					DECRYPT BLOB:C690($_blb_Version; $_blb_VersionerPublicKey)
					DECRYPT BLOB:C690($_blb_VersionBlob2; $_blb_VersionerPublicKey)
					DECRYPT BLOB:C690($_blb_VersionBlob3; $_blb_VersionerPublicKey)
					$_l_offset:=0
					$_l_SetVersion:=BLOB to longint:C551($_blb_VersionBlob2; Macintosh byte ordering:K22:2; $_l_offset)
					$_l_ReleaseVersion:=BLOB to longint:C551($_blb_VersionBlob2; Macintosh byte ordering:K22:2; $_l_offset)
					$_t_Place:=BLOB to text:C555($_blb_VersionBlob2; Mac Pascal string:K22:8; $_l_offset)
					$_t_VerLicenceVersionString:=BLOB to text:C555($_blb_VersionBlob2; Mac Pascal string:K22:8; $_l_offset)
					$_t_FullVersionString:=BLOB to text:C555($_blb_VersionBlob2; Mac Pascal string:K22:8; $_l_offset)
					
					READ WRITE:C146([PREFERENCES:116])
					UNLOAD RECORD:C212([PREFERENCES:116])
					$_l_ItemID:=PREF_GetPreferenceID("Version Control")
					If ($_l_ItemID>0)
						QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)  //One record for the database
						
					End if 
					$_l_offset:=0
					SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
					VARIABLE TO BLOB:C532($_blb_Version; [PREFERENCES:116]DataBlob:2; *)
					VARIABLE TO BLOB:C532($_blb_VersionBlob2; [PREFERENCES:116]DataBlob:2; *)
					VARIABLE TO BLOB:C532($_blb_VersionBlob3; [PREFERENCES:116]DataBlob:2; *)
					SAVE RECORD:C53([PREFERENCES:116])
					UNLOAD RECORD:C212([PREFERENCES:116])
					
					//VARIABLE TO BLOB([PREFERENCES]DataBlob;$_blb_Version;$_l_offset)
					//VARIABLE TO BLOB([PREFERENCES]DataBlob;$_blb_VersionBlob2;$_l_offset)
					//VARIABLE TO BLOB([PREFERENCES]DataBlob;$_blb_VersionBlob3;$_l_offset)
					
					
				End if 
				
				<>VER_S80_DataVersion:=$_t_VerLicenceVersionString
				//VER_SETVERSION ($_bo_GetDataVersion)
				$_l_offset:=0
				$_l_SetVersion:=BLOB to longint:C551($_blb_VersionBlob2; Macintosh byte ordering:K22:2; $_l_offset)
				$_l_ReleaseVersion:=BLOB to longint:C551($_blb_VersionBlob2; Macintosh byte ordering:K22:2; $_l_offset)
				$_t_Place:=BLOB to text:C555($_blb_VersionBlob2; Mac Pascal string:K22:8; $_l_offset)
				$_t_VerLicenceVersionString:=BLOB to text:C555($_blb_VersionBlob2; Mac Pascal string:K22:8; $_l_offset)
				$_t_FullVersionString:=BLOB to text:C555($_blb_VersionBlob2; Mac Pascal string:K22:8; $_l_offset)
				
				
			End if 
			
			<>VER_S80_DataVersion:=$_t_VerLicenceVersionString
			
			
			
			$0:=$_t_VerLicenceVersionString
			
			
		Else 
			If (<>VER_T_Version="")
				
				$_t_VersionControlPath:=Get 4D folder:C485(Current resources folder:K5:16)+"Version_Control"
				$_t_DataFilePath:=$_t_VersionControlPath+".4DD"
				$_t_StructureFIlePath:=$_t_VersionControlPath+".4DB"
				
				
				
				
				
				
				Begin SQL
					USE LOCAL DATABASE DATAFILE <<$_t_VersionControlPath>> auto_close;
					SELECT  VER_DATA
					FROM VERSION_INFORMATION
					WHERE BIT_LENGTH(VER_STRING) > 0
					INTO  :$_blb_VersionBlob2;
					USE DATABASE SQL_INTERNAL;
				End SQL
				If (BLOB size:C605($_blb_VersionBlob2)>0)
					VER_T_PrivateKEYTEXT:="-----BEGIN RSA PRIVATE KEY-----"+Char:C90(10)+"MIIEowIBAAKCAQEA8CRUazeyAI1h6XXqaqiCw+LrGDh7IWF7sLU7ku3N+MDLQuwj"+Char:C90(10)+"ois37yINtIwvmtQIAh1PSV+nYOSB/iz2QQXx7vd7R842dEgRRmnEvO5oxYGClbq9"+Char:C90(10)+"FxtWCgfkJ6fBvTyorHKolII203fNm1cebMbCuW3eCUs2Aja797B9jMGMMKJZWZ75"+Char:C90(10)+"LEq6r+a6saULruRz/vZXGkbNywqrjQEfplOfKpFNWI6lBNtsDgRGegoN/PT1COKz"+Char:C90(10)+"oxgfC/FGTCPYEcPUBLGoE+jjGfyik7BqMBU/Y9p1UlVlVriKokawXpUTJpASUcLB"+Char:C90(10)+"3lhC6PofD7sua03kJTExMBuYeQk1aS82+eIYPwIDAQABAoIBAAum96GsNirosVOO"+Char:C90(10)+"sS0zuAShQh8OvorEHCha4uUiPNhRIovAwYng5vnngRq9oqG0oB7aJTq+NXTyIYyf"+Char:C90(10)+"yeMl0rNxtr2pN+M0jAIKp80zFEphGmEBiqNQZEBgWaXC8heoldaoSZ3LI7XnHkbn"+Char:C90(10)+"V0aX7mLo/dkdmSVKWpyOJ8loqtDBN9m6VToQOnGd9/vqEKe/dQ7DMt3w0Fo7u0pJ"+Char:C90(10)+"VCwZgfYTS2RAbsb+TW+i1XqY1uNLC7Nk2+SrqyIkkmsyjxlHr87gI4N5QM/JQvx1"+Char:C90(10)+"yU+Cfw4zX2+8cljl2uMwUVVxHPltOt0suga9xkLn4jMK0lmopCvGQrzq/jUhQ+Dr"+Char:C90(10)+"/rmnmyECgYEA/+rVvvwQ8Ak49ZbYea8o2iG7Wu48bLNWhHfbrSrcMjIz5zrcEdRl"+Char:C90(10)+"OZa55J6cnNwX6VH+4SUYqXW9uUdAVmK8DyTgJDKmncuhbLjkgTg0sC02QUZ50EB+"+Char:C90(10)+"3gdBGmSK5Amge47C/IIO07QyyLzw4hSXcHieTw+MvQI7afVZ6czjxr0CgYEA8Dgw"+Char:C90(10)+"rW/d+ikPiGor1xXxT/HRjkYmNbKVwsY0D9TZy6zpraOrPzCyYQByONiqLsh58map"+Char:C90(10)+"6teNe48kDI38wr5DQPcB8lyHKJAzs5976Iq6/9yau69zFSO7yNvPchd3y7qLa2sf"+Char:C90(10)+"ZHpAA+vUxdODV+R6u3MPTMeLEEOldkPdDuT/OKsCgYBHjs1nkqnVxG5l1WEAXWbp"+Char:C90(10)+"32a43UaOCnNVpQIK4KIjcwAqVr30SlRnjuq5r1QRVEVnWyMOp0XHFIIRTYgC36bA"+Char:C90(10)+"AUqfNH58PtULRoO2UhYBcRLrm54yCeavhI3CqHxhmQODqP6ChodI0OkmUhZ00Ncr"+Char:C90(10)+"fr6dUrbCnt4oGY+jnUPPbQKBgQDRnBZNoImPWfjlzc8HVWxFl/qFLQz2Wih31r9i"+Char:C90(10)+"+RY6tV0KWQB6mSFtpxgEJnsJa4GNVKv78a7RHCwWkGb3/1FsBJ08QCTn7jxPBmD2"+Char:C90(10)+"nudhj7us/gFrdszLDZLMOVIdAV/akZTI9iuZwFTfchrvvLyjiFjXZF8iCAT/V2Qz"+Char:C90(10)+"NPrHFQKBgCaslIy5BtpzUER2CPBGLiDqRMqFjDBDfSLYrbt9D/pba93FHJUqH1wZ"+Char:C90(10)+"YcbevSGalnudYnxSIMG+grCb9x9SLw3o0eWAoGkSoeWIVU6E0O5vETmtANtX9GtI"+Char:C90(10)+"G/NIdxB6HjM6M/SfFvqWEU2UBBxSArq6s69eTKoEgNDYt22LTYKU"+Char:C90(10)+"-----END RSA PRIVATE KEY-----"+Char:C90(10)+""
					VER_T_PublicKEYTEXT:="-----BEGIN RSA PUBLIC KEY-----"+Char:C90(10)+"MIIBCgKCAQEA8CRUazeyAI1h6XXqaqiCw+LrGDh7IWF7sLU7ku3N+MDLQuwjois3"+Char:C90(10)+"7yINtIwvmtQIAh1PSV+nYOSB/iz2QQXx7vd7R842dEgRRmnEvO5oxYGClbq9FxtW"+Char:C90(10)+"CgfkJ6fBvTyorHKolII203fNm1cebMbCuW3eCUs2Aja797B9jMGMMKJZWZ75LEq6"+Char:C90(10)+"r+a6saULruRz/vZXGkbNywqrjQEfplOfKpFNWI6lBNtsDgRGegoN/PT1COKzoxgf"+Char:C90(10)+"C/FGTCPYEcPUBLGoE+jjGfyik7BqMBU/Y9p1UlVlVriKokawXpUTJpASUcLB3lhC"+Char:C90(10)+"6PofD7sua03kJTExMBuYeQk1aS82+eIYPwIDAQAB"+Char:C90(10)+"-----END RSA PUBLIC KEY-----"+Char:C90(10)+""
					TEXT TO BLOB:C554(VER_T_PrivateKEYTEXT; $_blb_MyPrivateKey)
					TEXT TO BLOB:C554(VER_T_PublicKEYTEXT; $_blb_VersionerPublicKey)
					
					DECRYPT BLOB:C690($_blb_VersionBlob2; $_blb_VersionerPublicKey)
					$_l_offset:=0
					$_l_SetVersion:=BLOB to longint:C551($_blb_VersionBlob2; Macintosh byte ordering:K22:2; $_l_offset)
					$_l_ReleaseVersion:=BLOB to longint:C551($_blb_VersionBlob2; Macintosh byte ordering:K22:2; $_l_offset)
					$_t_Place:=BLOB to text:C555($_blb_VersionBlob2; Mac Pascal string:K22:8; $_l_offset)
					$_t_VerLicenceVersionString:=BLOB to text:C555($_blb_VersionBlob2; Mac Pascal string:K22:8; $_l_offset)
					$_t_FullVersionString:=BLOB to text:C555($_blb_VersionBlob2; Mac Pascal string:K22:8; $_l_offset)
				Else 
					If ($_l_GetDataRes>0)
						//this must be the first time this data file has been opened with a V13 version
						$_t_StructurePath:=Data file:C490
						$_t_DirectoryPath:=PathFromPathName($_t_StructurePath)
						$_t_DirectorySymbol:=Directory_Symbol
						$_t_NewResourcePath:=$_t_DirectoryPath+"DataResources.rsr"
						If (Is a document:K24:1=(Test path name:C476($_t_NewResourcePath)))
							$_ti_Result:=Open resource file:C497($_t_NewResourcePath)
						Else 
							$_ti_Result:=_O_Create resource file:C496($_t_NewResourcePath)
						End if 
						GET RESOURCE:C508("VERS"; 19191; VER_blb_ResourceBlob; $_l_Result)  //Donot change the res ID
						If (BLOB size:C605(VER_blb_ResourceBlob)>0)
							$_l_offset:=0
							$_l_SetVersion:=BLOB to longint:C551(VER_blb_ResourceBlob; Macintosh byte ordering:K22:2; $_l_offset)
							$_l_ReleaseVersion:=BLOB to longint:C551(VER_blb_ResourceBlob; Macintosh byte ordering:K22:2; $_l_offset)
							$_t_Place:=BLOB to text:C555(VER_blb_ResourceBlob; Mac Pascal string:K22:8; $_l_offset)
							$_t_VerLicenceVersionString:=BLOB to text:C555(VER_blb_ResourceBlob; Mac Pascal string:K22:8; $_l_offset)
							$_t_FullVersionString:=BLOB to text:C555(VER_blb_ResourceBlob; Mac Pascal string:K22:8; $_l_offset)
						Else 
						End if 
						<>VER_S80_DataVersion:=$_t_VerLicenceVersionString
						
					Else 
						//somthing very wrong here-this should not be blank!!!
					End if 
				End if 
				
				If ($_l_GetDataRes=0)  //update structure version variables
					<>VER_T_Version:=$_t_VerLicenceVersionString
				Else 
					<>VER_S80_DataVersion:=$_t_VerLicenceVersionString
				End if 
			Else 
				$_t_VerLicenceVersionString:=<>VER_T_Version
			End if 
			$0:=$_t_VerLicenceVersionString
		End if 
End case 

CLEAR SEMAPHORE:C144("LOCKVERSION")
ERR_MethodTrackerReturn("VER_GetVersion"; $_t_oldMethodName)
