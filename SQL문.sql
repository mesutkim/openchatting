SELECT 
        *
  FROM
        (SELECT
                DETAIL_NO
                ,TITLE
                ,A.CHAT_NO
                ,A.USER_ID
                ,A.CONTENT
                ,ORIGIN_NAME
                ,CHANGE_NAME
                ,CREATE_DATE
          FROM
                CHAT_CONTENT A
          JOIN
                CHAT B ON (A.CHAT_NO = B.CHAT_NO)
         WHERE	
                    DETAIL_NO = 9
         ORDER
            BY
                CREATE_DATE DESC)
 WHERE 
		        ROWNUM = 1
UNION
SELECT
        *
  FROM
        (SELECT
                DETAIL_NO
                ,TITLE
                ,A.CHAT_NO
                ,A.USER_ID
                ,A.CONTENT
                ,ORIGIN_NAME
                ,CHANGE_NAME
                ,CREATE_DATE
          FROM
                CHAT_CONTENT A
          JOIN
                CHAT B ON (A.CHAT_NO = B.CHAT_NO)
         WHERE	
                    DETAIL_NO = 10
         ORDER
            BY
                CREATE_DATE DESC)
 WHERE 
        ROWNUM = 1;
        
        
        
SELECT
  				DETAIL_NO
  				,TITLE
  				,A.CHAT_NO
  				,A.USER_ID
  				,A.CONTENT
  				,ORIGIN_NAME
  				,CHANGE_NAME
  				,CREATE_DATE
  		  FROM
  		  		CHAT_CONTENT A
  		  JOIN
  		  		CHAT B ON (A.CHAT_NO = B.CHAT_NO)
  		 WHERE
  		 		A.DETAIL_NO = 9
  		 ORDER
  		    BY
  		    	CREATE_DATE ASC