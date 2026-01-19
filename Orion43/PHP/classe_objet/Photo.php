<?php
class Photo {

    private $photo_id;
    private $url;
    private $titre;
    private $infos_techniques;
    private $date_prise;

    public function getUrl() {
        return $this->url;
    }

    public function getTitre() {
        return $this->titre;
    }

    public function getInfosTechniques() {
        return $this->infos_techniques;
    }

    public function getDate() {
        return $this->date_prise;
    }
}
