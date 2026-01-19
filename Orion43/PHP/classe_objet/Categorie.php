<?php
class Categorie {

    private $categorie_id;
    private $nom;
    private $slug;

    public function getId() {
        return $this->categorie_id;
    }

    public function getNom() {
        return $this->nom;
    }

    public function getSlug() {
        return $this->slug;
    }
}
