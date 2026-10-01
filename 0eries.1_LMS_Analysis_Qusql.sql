SELECT TOP (1000) [student_id]
      ,[student_name]
      ,[course_name]
      ,[price_jod]
      ,[completion_rate]
      ,[days_inactive]
  FROM [LMS_DB].[dbo].[Fact_Enrollments]

USE LMS_DB;
GO

-- الاستعلام الأول: تقرير المبيعات والإيرادات لكل كورس
SELECT 
    course_name, 
    COUNT(student_id) AS total_students,
    SUM(price_jod) AS total_revenue_jod
FROM dbo.Fact_Enrollments
GROUP BY course_name
ORDER BY total_revenue_jod DESC;
GO

-- الاستعلام الثاني: تقرير الطلاب المعرضين للتسرب (المنقطعين أكثر من 14 يوماً)
SELECT 
    student_id,
    student_name, 
    course_name, 
    days_inactive, 
    completion_rate
FROM dbo.Fact_Enrollments
WHERE days_inactive > 14
ORDER BY days_inactive DESC;
GO

-- الاستعلام الثالث: تقرير متوسط نسبة إكمال الدروس لكل كورس
SELECT 
    course_name, 
    AVG(completion_rate) AS avg_completion_rate
FROM dbo.Fact_Enrollments
GROUP BY course_name;
GO