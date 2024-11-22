package org.quyet.libman.dao;

import org.quyet.libman.model.Document;

import java.util.List;

public interface DocumentDAO {
    List<Document> getDocumentsByName(String name);
}
