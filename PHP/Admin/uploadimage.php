<?php

$imageName = time() . '_' . $_FILES['image']['name'];
move_uploaded_file(
    $_FILES['image']['tmp_name'],
    '../uploads/gallery/' . $imageName
);
