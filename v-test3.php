<?php
// vulnerable_page.php - 취약한 검색 페이지

if(isset($_GET['search'])) {
    $search_term = $_GET['search'];
    echo "<h2>검색 결과: " . $search_term . "</h2>";
    echo "<p>'" . $search_term . "'에 대한 검색 결과가 없습니다.</p>";
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>취약한 검색 페이지</title>
</head>
<body>
    <h1>상품 검색</h1>
    <form method="GET">
        <input type="text" name="search" placeholder="검색어를 입력하세요">
        <button type="submit">검색</button>
    </form>
</body>
</html>
